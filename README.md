# kelp-spore-drift-models
Code and data associated with the manuscript "Modeling grazer-mediated effects of demographic and material connectivity on giant kelp metapopulation dynamics"

This repository contains all code used in the manuscript “Modeling grazer-mediated effects of demographic and material connectivity on giant kelp metapopulation dynamics” by A.R. Detmer. Data analyses and the majority of model simulations were performed in R v4.0.5, and all code is included here as .Rmd files in the "kelp_connectivity_code" folder, which includes the following subfolders:

- Empirical_data: code for formatting published empirical data 
- GLMM_analyses: code for fitting GLMM models to the empirical data
- ODE_theoretical_analyses: code for parameterizing and analyzing the ODE model. Some of these analyses were done in Mathematica (v13.0), and the code for these is included as a  .nb file. 
- ODE_validation_GLMM: code for running ODE model simulations to compare to the predictions of the GLMM model
- Supp_drift_kelp: code for analyzing published data on drifting kelp plants (Ohlmann 2019)

The "intermediate_data_output" folder includes any datasets that were subset/formatted from their original sources in one .Rmd file or in a different programming language (some ODE model analyses and data processing were done in Mathematica v13.0 and Matlab vR2021b, respectively) and subsequently used in another .Rmd file. Note all code that exports or imports these intermediate data files requires the same file structure as in this github repository to run.

Citations for all datasets used in analyses:

Bell et al. (in prep)

Castorani MCN, Reed DC, Raimondi PT, Alberto F, Bell TW, Cavanaugh KC, Siegel DA (2022) Kelp metapopulations: Semi-annual time series of giant kelp patch area, biomass and fecundity in southern California, 1996 – 2006 ver 2. Environmental Data Initiative. https://doi.org/10.6073/pasta/4c5a27154458ece5585384339eb0c2ee

Castorani MCN, Siegel DA, Simons RD, Reed DC, Raimondi PT, Alberto F (2022) Kelp metapopulations: Semi-annual time series of spore dispersal times among giant kelp patches in southern California, 1996 – 2006 ver 4. Environmental Data Initiative. https://doi.org/10.6073/pasta/d1107107e7c9ebc6476dfbe9e64eb6cb

Cavanaugh KC, Siegel DA, Raimondi PT, Alberto F (2019) SBC LTER: Spatial definitions of giant kelp (Macrocystis pyrifera) patches in southern and central California ver 2. Environmental Data Initiative. https://doi.org/10.6073/pasta/97ef540ba3fc62dff50779533bb39466

DiFiore B, Rennick M, Curtis J, Reed DC, Stier A (2021) SBC LTER: Sea urchin foraging rates on giant kelp ver 1. Environmental Data Initiative. https://doi.org/10.6073/pasta/6af4cc3b0e63b887baf1ae9201e1cd1d

Kushner D, Rassweiler A, McLaughlin JP, Lafferty KD (2013) A multi-decade time series of kelp forest community structure at the California Channel Islands. Ecology 94:2655. https://esapubs.org/archive/ecol/E094/245/

Ohlmann C (2019) Data from freely drifting kelp plants tagged with drifters in the Santa Barbara Channel between November of 2015 and December of 2017. Biological and Chemical Oceanography Data Management Office. https://doi.org/10.1575/1912/bco-dmo.739111.1

SBC LTER, Rassweiler AA, Harrer S, Reed DC, Nelson CJ, Miller RJ (2023) SBC LTER: REEF: Net primary production, growth and standing crop of Macrocystis pyrifera in Southern California ver 7. Environmental Data Initiative. https://doi.org/10.6073/pasta/1dcf59ef5a7ec3fd7c90203e3a2c171a

SBC LTER, Reed DC, Miller RJ (2022) SBC LTER: Reef: Kelp Forest Community Dynamics: Abundance and size of Giant Kelp (Macrocystis Pyrifera), ongoing since 2000 ver 26. Environmental Data Initiative. https://doi.org/10.6073/pasta/7d7b640d5cafd29c00a647f6016e165d

SBC LTER, Reed DC, Miller RJ (2022) SBC LTER: Reef: Kelp Forest Community Dynamics: Cover of sessile organisms, Uniform Point Contact ver 31. Environmental Data Initiative. https://doi.org/10.6073/pasta/7b9f59d4875c4e235448dd42ff7044ad

SBC LTER, Reed DC, Miller RJ (2022) SBC LTER: Reef: Kelp Forest Community Dynamics: Invertebrate and algal density ver 29. Environmental Data Initiative. https://doi.org/10.6073/pasta/da35d83d200341c27ce50348e1835971

SBC LTER, Reed DC, Miller RJ (2023) SBC LTER: Reef: Kelp Forest Community Dynamics: Transect depth data ver 10. Environmental Data Initiative. https://doi.org/10.6073/pasta/1aed976cbe5c1fef745fc50e3d217747

SCB MBON, Miller RJ, Rassweiler AR, Caselle J, Kushner D, Reed DC, Lafferty KD, Kui L, O’Brien M (2021) Santa Barbara Channel Marine BON: Nearshore kelp forest integrated fish, 1981-ongoing ver 4. Environmental Data Initiative. https://doi.org/10.6073/pasta/dbf98d8ddc5f48c4bc074ae4293d8d7c



