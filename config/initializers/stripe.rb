Rails.configuration.stripe = {
  :publishable_key => 'pk_test_CfcnrrEelfYKOh2dYIDZdhwF',
  :secret_key      =>'sk_test_pxlrT4YhQNAf18No71e38dVI'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]