## what we want touch_in method to do:
- checking whether there is enough funds
(- checking whether user did touch out)
- storing entry station

## what we want touch_out method to do:
- checking whether user did touch_in (and charged penalty if not)
- store the exit station
- deduct right fare from the balance
- store the journey in journey_history
- create a new empty journey


## touch_in

- Check balance (done)
- Check if touch_out happened:
  - Check current journey's entry station --> should be nil. If not, charge PENALTY_FARE
  - if penalty charged, store journey and create new one
- store entry station in journey

## touch_out
 - Store exit_station
 - Check if touch_in happened:
  - Check current journey's entry station --> should not be nil. If nil, charge penalty
  - if not penalty, it should charge fare
 - Store journey in journey_history
 - create new empty journey




  1. touch_in but not touch_out:
  - Penalty to be charged on next touch_in
  - State = journey will have entry station but not exit station

  2. not touch_in and touch_out:
  - Penalty to be charged when touching_out
  - State = journey will not have entry station

  3. touch_in and touch_out:
  - MINIMUM_FARE to be charged when touching_out
  - State when touching_in = journey will be empty (no entry or exit station) 
  - State when touching_out = journey will have entry station and exit station