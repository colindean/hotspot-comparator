class PlanProcessor

  constructor: (@plan, @account) ->
    @plan.seed_account @account

  process_month: () ->
    @plan.process_account @account

  process_months: (number) ->
    process_month for num in [0..number]
