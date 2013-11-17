class Account

  @available_mb = 0
  @charges = []
  @usages = []
  @monthly_usage = 0

  constructor: (@monthly_usage, @available = 0) ->
   
  credit_mb: (amount) ->
    @available_mb += amount

  deduct_usage: ->
    @available_mb -= @monthly_usage

  add_charge: (amount,usage) ->
    @charges.push amount
    @usages.push usage

  get_charge: (index) ->
    [@charges[index], @usages[index]]

  sum_charges: ->
    @charges.reduce (current, accumulator) ->
      accumulator + current

  needs_more_mb: ->
    @available_mb < @monthly_usage

  mb_needed: ->
    Math.abs(Math.min(0, @available_mb - @monthly_usage))
