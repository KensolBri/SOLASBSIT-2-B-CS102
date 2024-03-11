library(rvest)
library(polite)

url <- "https://www.amazon.com/s?i=specialty-aps&bbn=16225016011&rh=n%3A%2116225016011%2Cn%3A229575&ref=nav_em__nav_desktop_sa_intl_pc_0_2_26_10"

session <- bow(url, user_agent = "Educational Perfume")

session_page <- scrape(session)

div_elements <- html_nodes(session_page,'div.sg-col-20-of-24.s-matching-dir.sg-col-16-of-20.sg-col.sg-col-8-of-12.sg-col-12-of-16')

links <- character()
img_srcs <- character()
titles <- character()
prices <- character()
ratings <- character()

for (div_element in div_elements) {
  
  a_element <- html_node(div_element, 'a.a-link-normal.s-no-outline')
  link <- ifelse(!is.na(a_element), paste0("https://amazon.com", html_attr(a_element, "href")), '')
  
  
  img_element <- html_node(div_element, 'img.s-image')
  img_src <- ifelse(!is.na(img_element), html_attr(img_element, "src"), '')
  
  
  title_element <- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  title <- ifelse(!is.na(title_element), html_text(title_element), '')
  
  
  price_element <- html_node(div_element, 'span.a-price')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  
  links <- c(links, link)
  img_srcs <- c(img_srcs, img_src)
  titles <- c(titles, title)
  prices <- c(prices, price)
  ratings <- c(ratings, rating)
}


product_df <- data.frame(Links = links,
                         Images = img_srcs,
                         Title = titles,
                         Price = prices,
                         Rating = ratings)


write.csv(product_df, "product.csv")


url <- "https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A3011391011&ref=nav_em__nav_desktop_sa_intl_laptop_accessories_0_2_6_7"

session <- bow(url, user_agent = "Educational Perfume")

session_page <- scrape(session)

div_elements <- html_nodes(session_page,'div.sg-col-20-of-24.s-matching-dir.sg-col-16-of-20.sg-col.sg-col-8-of-12.sg-col-12-of-16')

links <- character()
img_srcs <- character()
titles <- character()
prices <- character()
ratings <- character()

for (div_element in div_elements) {
  
  a_element <- html_node(div_element, 'a.a-link-normal.s-no-outline')
  link <- ifelse(!is.na(a_element), paste0("https://amazon.com", html_attr(a_element, "href")), '')
  
  
  img_element <- html_node(div_element, 'img.s-image')
  img_src <- ifelse(!is.na(img_element), html_attr(img_element, "src"), '')
  
  
  title_element <- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  title <- ifelse(!is.na(title_element), html_text(title_element), '')
  
  
  price_element <- html_node(div_element, 'span.a-price')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  
  links <- c(links, link)
  img_srcs <- c(img_srcs, img_src)
  titles <- c(titles, title)
  prices <- c(prices, price)
  ratings <- c(ratings, rating)
}


second_df <- data.frame(Links = links,
                         Images = img_srcs,
                         Title = titles,
                         Price = prices,
                         Rating = ratings)


write.csv(second_df, "second.csv")

