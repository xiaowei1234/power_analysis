# Testing the effect of lowering multiplier on take rate

## Hypothesis

Lowering the APR will lead to a higher take rate, especially for the online channel, which has had historically had low take rate vs brick & mortar stores.

## Metric of interest
Take rate of 15 month offers at the user_id level. Defined as the number of leases divided by users (not applications) approved by decisioning and fraud checks/KBA.

## Data

Number of apps - number of unique `user_id` values that were approved but did not qualify for the prime 24 month offer (post fraud checks)

Number of offers - number of leases corresponding to apps in above "Number of apps"

## Procedure

For applicants that come through the online channel, randomly split with a 50/50 into either the control or the treatment. Care needs to be taken that if an applicant applies more than once then that person always relegates to the same group originally assigned during the experiment.

Assuming a 50/50 split between the control & treatment groups, the experiment should run until at least 7,200 users have been assigned to each group. Based upon history, this study should run a minimum of 19 days with an expectation that it ends after three weeks, after which 

If it is desired that less than 50% of applicants be assigned to the treatment, then an additional analysis would need to be done to ensure adequate statistical power (ability to discern a true effect)

## Statistical analysis of requisite sample size

Using the `pwr` package in `R`, the following parameters were entered into the `pwr.2p.test` function to calculate the required sample size for a two sample test of proportions.

effect_size (Cohen's h statistic) = ES.h(t*1.1, t) where t = 0.197 (current take rate for 15 month offers)
power = 0.9 (probability of finding true effect when present)
alternative = "greater" (for a one tail test)
sig.level = 0.05 (Probability of finding an effect when non present)