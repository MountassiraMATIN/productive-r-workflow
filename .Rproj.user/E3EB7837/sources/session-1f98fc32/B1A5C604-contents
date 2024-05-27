#function for creating a scatterplot
create_scatterplot <- function(data, selected_species, selected_island) {
  # Filter the data for the specified species and island
  filtered_data <- data %>%
    na.omit() %>%
    dplyr::filter(species == selected_species, island == selected_island)
  
  # Create the scatterplot
  plot <- ggplot2::ggplot(
    filtered_data,
    ggplot2::aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)
  ) +
    ggplot2::geom_point() +
    ggplot2::labs(
      x = "Bill Length (mm)",
      y = "Bill Depth (mm)",
      title = paste("Penguin Bill Dimensions -", selected_species, "-", selected_island)
    )
  
  return(plot)
}