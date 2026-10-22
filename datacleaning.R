view(starwars) # Opens a spreadsheet style tab of data

glimpse(starwars) # Preview data in a transpose way

class(starwars$gender) # Show data type
unique(starwars$gender) # Shows the values (no repeats)

starwars$gender <- as.factor(starwars$gender) # Turn certain data types into factors 
class(starwars$gender)

levels(starwars$gender)

# Used to swap the levels between genders
starwars$gender <- factor((starwars$gender), levels = c("masculine", "feminine"))
levels(starwars$gender)

names(starwars) #Lists the data catergories labels

# Select the name, height, hair color, skin color, and eye color variables
# Then filter the hair colors so it only shows entries with blond and brown hair
# Then filter again so the height is less than 180 units
starwars %>%
  select(name, height, ends_with("color")) %>%
  filter(hair_color %in% c("blond", "brown") & 
           height < 180) 

# Missing data
mean(starwars$height, na.rm = TRUE) # Average height with NA not accounted

# Used to see the entries with na and make cleaning decisions on them
# Below I remove the entries with no height
starwars %>%
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) %>%
  drop_na(height)

hello?


## Replacing na's with "None" for hair color
starwars %>% 
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) %>%
  mutate(hair_color = replace_na(hair_color, "none"))

# Replacing values into numerical
starwars %>%
  select(name, gender, hair_color, height) %>%
  mutate(gender = recode(gender, "masculine" = 1, "feminine" = 2))
                  
# Duplicates

Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 33, 44, 22)

friends <- data_frame(Names, Age)

friends[!duplicated(friends), ]

friends %>% distinct()