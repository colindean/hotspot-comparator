class Plan

  starting_mb: 0
  monthly_mb_credit: 0
  monthly_cost: 0

  upfront_cost: 0
  
  cost_per_mb: 0

  minimum_mb_purchase: 0

  rollover: true

  cost_for_mb: (mb) ->
    mb * cost_per_mb

  seed_account: (account) ->
    account.credit_mb starting_mb

  process_account: (account) ->
    account.credit_mb monthly_mb_credit

    mb_to_buy = 0
    charge = 0

    if account.needs_more_mb
      mb_to_buy = Math.max(minimum_mb_purchase, account.mb_needed)
      charge = mb_to_buy * cost_per_mb

      account.credit_mb mb_to_buy
    
    account.charge charge, mb_to_buy

    account.deduct_usage
      
  

