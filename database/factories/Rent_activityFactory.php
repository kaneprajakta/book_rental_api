<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class Rent_activityFactory extends Factory
{
    
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'ra_b_id' => rand(1,10),
            'ra_u_id' => rand(1,10),
            'ra_rented_on' => date('Y-m-d H:i:s'),
            'ra_return_due_on' => date('Y-m-d H:i:s',strtotime('+2 weeks')),
        
        ];
    }


}
