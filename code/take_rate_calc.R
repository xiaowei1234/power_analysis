library(pwr)

raw_df <- read.csv('../data/raw_data.csv')

# what we want the minimum increase in effect
percentage_increase = 0.1

# what we want the the minimum power to be
min_power = 0.9

# alternative
alt = "greater"

take_rate = raw_df$take_rate[1]
apps_per_day = raw_df$apps_per_day[1]
effect_size = ES.h(take_rate * (1 + percentage_increase), take_rate)

test = pwr.2p.test(h=effect_size, power=min_power, alternative=alt)

print (test)

cat("Approx number of days to hit sample size if 50/50 split: ", test$n/apps_per_day * 2)
