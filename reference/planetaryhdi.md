# planetaryhdi: Planetary Pressures Adjusted HDI for countries and aggregates, 2022

Planetary pressures-adjusted HDI (PHDI) for 195 countries and
territories and 15 UNDP aggregates (development groups, regions and the
world), from the UNDP Human Development Report 2023/2024. Values refer
to 2022, except carbon dioxide emissions per capita and its index, which
refer to 2021. PHDI is HDI adjusted for production-based carbon dioxide
emissions and material footprint per capita. The dataset also includes
information on percentage difference in HDI after adjusting for
planetary pressures and change in rank when the HDI is corrected for
these pressures.

## Usage

``` r
planetaryhdi
```

## Format

A tibble with 210 rows and 12 variables

- hdi_rank:

  Rank by HDI

- country:

  Name of the country

- hdi:

  Human Development Index (HDI): A composite index measuring average
  achievement in three basic dimensions of human development (a long and
  healthy life, knowledge and a decent standard of living). See
  Technical note 1 at
  https://hdr.undp.org/sites/default/files/2023-24_HDR/hdr2023-24_technical_notes.pdf
  for details on how the HDI is calculated.

- phdi:

  Planetary pressures-adjusted HDI (PHDI): HDI value adjusted by the
  level of carbon dioxide emissions and material footprint per capita to
  account for the excessive human pressure on the planet. It should be
  seen as an incentive for transformation. See Technical note 6 at
  https://hdr.undp.org/sites/default/files/2023-24_HDR/hdr2023-24_technical_notes.pdf
  for details on how the PHDI is calculated.

- pct_diff_hdi:

  Percentage Difference in HDI and Planetary HDI (calculated as: \[HDI -
  PHDI\] / HDI)

- rank_diff_hdi:

  Difference in rank between PHDI and HDI. Expressed as Rank(phdi) -
  Rank(hdi)

- adj_factor:

  Adjustment factor for planetary pressures: Arithmetic average of the
  carbon dioxide emissions index and the material footprint index, both
  defined below. A high value implies less pressure on the planet.

- tco2_per_capita_prod:

  Carbon dioxide emissions per capita (production): carbon dioxide
  emissions produced as a consequence of human activities (use of coal,
  oil and gas for combustion and industrial processes, gas flaring and
  cement manufacture), divided by midyear population. Values are
  territorial emissions, meaning that emissions are attributed to the
  country in which they physically occur.

- co2_emissions_index:

  Carbon dioxide emissions (production) index: Carbon dioxide emissions
  per capita (production-based) expressed as an index using a minimum
  value of 0 and a maximum value of 76.61 tonnes per capita. A high
  value of this index implies less pressure to the planet.

- material_footprint_per_capita:

  Material footprint per capita: Material Footprint (MF) is the
  attribution of global material extraction to domestic final demand of
  a country. The total material footprint is the sum of the material
  footprint for biomass, fossil fuels, metal ores and non-metal ores.
  This indicator is calculated as raw material equivalent of imports
  (RMEIM) plus domestic extraction (DE) minus raw material equivalents
  of exports (RMEEX). Per-capita MF describes the average material use
  for final demand.

- material_footprint_index:

  Material footprint index: Material footprint per capita expressed as
  an index using a minimum value of 0 and a maximum value of 140.82
  tonnes per capita. A high value of this index implies less pressure to
  the planet.

- iso3c:

  ISO 3166-1 alpha-3 country code

## Source

Obtained from the UNDP Human Development Report 2023/2024 Statistical
Annex, PHDI table
(<https://hdr.undp.org/data-center/documentation-and-downloads>),
published under the Creative Commons Attribution 3.0 IGO licence.

## Examples

``` r
# Countries with the largest drop from HDI to PHDI
head(planetaryhdi[order(-planetaryhdi$pct_diff_hdi), c("country", "hdi", "phdi", "pct_diff_hdi")])
#> # A tibble: 6 × 4
#>   country                hdi  phdi pct_diff_hdi
#>   <chr>                <dbl> <dbl>        <dbl>
#> 1 Qatar                0.875 0.45          48.6
#> 2 Kuwait               0.847 0.58          31.5
#> 3 Brunei Darussalam    0.823 0.576         30.0
#> 4 Oman                 0.819 0.593         27.6
#> 5 United Arab Emirates 0.937 0.688         26.6
#> 6 Luxembourg           0.927 0.685         26.1
```
