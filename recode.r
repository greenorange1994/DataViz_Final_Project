
new_pit <- pit_rest[, c("business_id", "latitude", "longitude", "neighborhood", "stars", "price", "noise", "parking", "cuisine")]
review_na <- review_na %>% mutate(new_diff = rank_ratings - rank_senti)
new_pit <- left_join(new_pit, review_na[, c("new_diff", "business_id")], by = "business_id")
new_pit$class <- NA
new_pit$class[new_pit$new_diff >= 572.5] <- "More than Expected :)"
new_pit$class[new_pit$new_diff < 572.5 & new_pit$new_diff >= 7.0] <- "Recommend"
new_pit$class[new_pit$new_diff < 7.0 & new_pit$new_diff >= -535.0] <- "Not Bad"
new_pit$class[new_pit$new_diff < -535.0] <- "Disappointed :("
levels(new_pit$class) <- c("Disappointed :(", "Not Bad", "Recommend", "More than Expected :)")
saveRDS(new_pit, "new_pit")
