<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\RootController;
use App\Models\Category;
use App\Models\Log;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;
use Throwable;
use Illuminate\Validation\ValidationException;
use App\Services\Log\LoggerService;
use Illuminate\Support\Facades\Hash;

class CategoryController extends RootController
{
    /**
     * Display categories page
     */
    public function index()
    {

        /*$password = 'Mohamed@123';

        $hashedPassword = Hash::make($password);

        DB::table('users')->insert([
            'name' => 'Mohamed',
            'email' => 'mohamed@example.com',
            'password' => $hashedPassword,
            'role_id' => 3,
            'created_at' => now(),
            'updated_at' => now(),
        ]);*/

        // Load categories main page (datatable handled via AJAX)
        return backView('category.categories', [
            'page' => 'Categories'
        ]);
    }

    /**
     * Datatable AJAX source for categories list
     */
    public function dtCategories(Request $request): JsonResponse
    {
        try {
            // Base query for datatable
            $query = "
                SELECT c.*, CONCAT(u.first_name,' ',u.last_name) AS `user`
                FROM categories c
                LEFT JOIN users u ON u.id = c.user_id
                where deleted = 0
            ";

            // Datatable processing (pagination, search, ordering)
            $result = $this->DoDatatable($query, $request, function ($i, $row) {
                // Actions column (edit / delete buttons)
                $row->actions = '<div class="btn-group">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                        </button>
                        <ul class="dropdown-menu" style="">
                          <li>
                          <a class="dropdown-item" href="JavaScript:void(0)" data-action="edit-category"
                          data-id="'.$row->id.'">Edit</a>
                          </li>
                          <li>
                          <a class="dropdown-item" href="JavaScript:void(0)" data-action="delete-category"
                          data-id="'.$row->id.'">Delete</a>
                          </li>
                        </ul>
                      </div>';
            });

            return response()->json($result);

        } catch (Throwable $e) {

            // Log error for debugging
            logger()->error('Datatable categories error', [
                'message' => $e->getMessage(),
            ]);

            // Return JSON error response
            return response()->json([
                'success' => false,
                'message' => 'Unable to load categories list',
            ], 500);
        }
    }

    /**
     * Create / Edit category form
     */
    public function newCategory(?int $id = null)
    {
        try {
            // If ID exists → edit mode, otherwise create mode
            $category = $id ? Category::findOrFail($id) : null;

            return backView('category.new_category', [
                'page'     => 'New category',
                'category' => $category,
            ], true);

        } catch (ModelNotFoundException $e) {

            // Category not found
            return redirect()->back()->with('error', 'Category not found');

        } catch (Throwable $e) {

            // Any unexpected error
            logger()->error('Category form error', [
                'message' => $e->getMessage(),
            ]);

            return redirect()->back()->with('error', 'Something went wrong');
        }
    }

    public function storeCategory(Request $request): JsonResponse
    {
        try {
            // Validate request
            $validated = $request->validate([
                'category_id' => 'nullable|exists:categories,id',
                'name'        => 'required|string|min:3|max:255',
                'description' => 'nullable|string',
            ]);

            // If updating, load existing category to get "before" snapshot
            $categoryId = $validated['category_id'] ?? null;
            $category = $categoryId ? Category::find($categoryId) : null;
            $before = $category ? $category->getAttributes() : null;

            // Create or update category
            $category = Category::updateOrCreate(
                ['id' => $categoryId],
                [
                    'name'        => $validated['name'],
                    'description' => $validated['description'] ?? null,
                    'user_id'     => auth()->id(),
                ]
            );

            // "After" snapshot
            $after = $category->getAttributes();

            // Save log
            LoggerService::logModelChange(
                Category::class,
                $category->id,
                $categoryId ? 'update' : 'create',
                $before,
                $after
            );

            // Return success response
            return response()->json([
                'success' => true,
                'message' => 'Category saved successfully',
                'data'    => $category,
            ]);

        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (\Throwable $e) {
            logger()->error('Store category error', ['message' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong, please try again',
            ], 500);
        }
    }


    public function deleteCategory(Request $request): JsonResponse
    {
        try {
            // Validate request
            $request->validate([
                'category_id' => 'required|integer|exists:categories,id',
            ]);

            // Get category (not already deleted)
            $category = Category::where('id', $request->post('category_id'))
                ->where('deleted', 0)
                ->firstOrFail();

            // Soft delete (custom)
            $category->update([
                'deleted' => 1,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Category deleted successfully',
            ]);

        } catch (ModelNotFoundException $e) {

            return response()->json([
                'success' => false,
                'message' => 'Category not found',
            ], 404);

        } catch (\Throwable $e) {

            \Log::error('Delete category error: '.$e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

}
