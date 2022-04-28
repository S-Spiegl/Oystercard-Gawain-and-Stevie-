# Journey

## User Stories

```
As a customer
I need to know where I've travelled from

As a customer
I want to end a journey at a specific station

As a customer
I need to pay for my journey when it's complete

As a customer
I need to have the correct fare calculated

As a customer
I need a penalty charge deducted if I fail to touch in or out
```

## Diagram / Pseudocode

Journey
- PENALTY_CHARGE
  
- @fare
- @travelled_from
- @travelled_to

start_journey(start_station)
- should set @travelled_from to start_station

end_journey(end_station)
- should set @travelled_to to end_station

charge_correct_fare
- should calculate_correct_fare amount and change @fare to amount
- if the customer failed_to_touch_in_or_out it should change @fare by PENALTY_CHARGE
- should deduct oystercard.balance by @fare

**Errors from IRB feature test**

- uninitialized constant Journey
- undefined method `fare'
- undefined method `start_journey'
- undefined method `end_journey'
- undefined method 'charge_correct_fare'