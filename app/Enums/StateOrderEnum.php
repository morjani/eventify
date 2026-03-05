<?php

namespace App\Enums;

enum StateOrderEnum: string
{
    case PENDING = 'pending';
    case CONFIRMED = 'confirmed';
    case NO_RESPONSE = 'no_response';
    case DELIVERED = 'delivered';
    case CANCELLED = 'cancelled';
    case FAILED = 'failed';

    /**
     * Get readable label
     */
    public function label(): string
    {
        return match ($this) {
            self::PENDING    => 'Pending Validation',
            self::CONFIRMED  => 'Confirmed',
            self::NO_RESPONSE  => 'No Response',
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
            self::CONFIRMED  => 'info',
            self::NO_RESPONSE   => 'dark',
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
