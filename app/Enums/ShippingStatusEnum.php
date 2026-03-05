<?php

namespace App\Enums;

enum ShippingStatusEnum: string
{
    case PENDING   = 'pending';
    case PROCESSING = 'processing';
    case SHIPPED   = 'shipped';
    case DELIVERED = 'delivered';
    case CANCELLED = 'cancelled';
    case FAILED    = 'failed';

    /**
     * Get readable label
     */
    public function label(): string
    {
        return match ($this) {
            self::PENDING    => 'Pending',
            self::PROCESSING => 'Processing',
            self::SHIPPED    => 'Shipped',
            self::DELIVERED  => 'Delivered',
            self::CANCELLED  => 'Cancelled',
            self::FAILED     => 'Failed',
        };
    }

    /**
     * Get color (for badges / UI)
     */
    public function color(): string
    {
        return match ($this) {
            self::PENDING    => 'warning',
            self::PROCESSING => 'primary',
            self::SHIPPED    => 'info',
            self::DELIVERED  => 'success',
            self::CANCELLED  => 'danger',
            self::FAILED     => 'danger',
        };
    }

    /**
     * Get all values (for validation)
     */
    public static function values(): array
    {
        return array_column(self::cases(), 'value');
    }
}
