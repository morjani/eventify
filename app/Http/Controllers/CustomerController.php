<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class CustomerController extends RootController
{

    public function searchCustomers(Request $request): JsonResponse
    {
        $search = $request->get('q');

        if (!$search) {
            return response()->json([]);
        }

        $products = \DB::table('customers')
            ->where(function ($query) use ($search) {
                $query->where('first_name', 'LIKE', "%{$search}%")
                    ->orWhere('first_name', 'LIKE', "%{$search}%")
                    ->orWhere('phone', 'LIKE', "%{$search}%")
                    ->orWhere('email', 'LIKE', "%{$search}%");
            })
            ->select(
                '*'
            )
            ->limit(20)
            ->get();

        return response()->json($products);
    }

    public function getCustomer(int $id): JsonResponse
    {

        try {

            $customer = DB::table('customers')
                ->select('*')
                ->where('id', $id)
                ->first();

            return response()->json([
                'success' => true,
                'message' => 'Customer loaded successfully',
                'customer' => $customer
            ]);

        } catch (\Throwable $e) {
            //Log Error (Never expose real error in production)
            logger()->error('Failed to load customer', [
                'customer_id' => $id,
                'error'      => $e->getMessage(),
                'file'       => $e->getFile(),
                'line'       => $e->getLine(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Unable to load customer',
                'variants' => []
            ], 500);
        }

    }
}
