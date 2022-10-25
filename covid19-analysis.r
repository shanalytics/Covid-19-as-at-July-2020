{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "8d4d1979",
   "metadata": {
    "_cell_guid": "ea9ec63c-df66-408d-84b9-bce3b6e0327b",
    "_uuid": "0bf00cf7-99da-46ce-b619-ecb182aa4fc2",
    "execution": {
     "iopub.execute_input": "2022-10-25T18:48:15.648323Z",
     "iopub.status.busy": "2022-10-25T18:48:15.646620Z",
     "iopub.status.idle": "2022-10-25T18:48:15.678979Z"
    },
    "papermill": {
     "duration": 0.005723,
     "end_time": "2022-10-25T18:54:20.126849",
     "exception": false,
     "start_time": "2022-10-25T18:54:20.121126",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Covid-19 2020 Data Analysis\n",
    "\n",
    "# **ASK**\n",
    "\n",
    "***Context***\n",
    "Previously known as SARS-COV2, the new coronavirus that causes COVID-19 respiratory virus infection is very dangerous. More than 600 million individuals have been infected, with over 6 million fatalities, and the pandemic has spread to 188 nations from its origin in Wuhan City, Hubei Province on mainland China.This data is as at July 2020.\n",
    "\n",
    "**Content**\n",
    "full_grouped.csv - Day to day country wise no. of cases (Has County/State/Province level data)\n",
    "covid19clean_complete.csv - Day to day country wise no. of cases (Doesn't have County/State/Province level data)\n",
    "countrywiselatest.csv - Latest country level no. of cases\n",
    "day_wise.csv - Day wise no. of cases (Doesn't have country level data)\n",
    "usacountywise.csv - Day to day county level no. of cases\n",
    "worldometer_data.csv - Latest data from https://www.worldometers.info/\n",
    "\n",
    "**Acknowledgements**\n",
    "https://github.com/CSSEGISandData/COVID-19\n",
    "https://www.worldometers.info/\n",
    "\n",
    "**Collection Methodology**\n",
    "https://www.kaggle.com/datasets/imdevskp/corona-virus-report\n",
    "\n",
    "# Process"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "66eb55e7",
   "metadata": {
    "_cell_guid": "a1968edd-b6a8-4a36-bfa8-a50abafb5022",
    "_uuid": "d0b4d932-1633-4e17-bf26-54e24b8bc218",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:54:20.140657Z",
     "iopub.status.busy": "2022-10-25T18:54:20.138269Z",
     "iopub.status.idle": "2022-10-25T18:55:21.636820Z",
     "shell.execute_reply": "2022-10-25T18:55:21.635108Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 61.508873,
     "end_time": "2022-10-25T18:55:21.640231",
     "exception": false,
     "start_time": "2022-10-25T18:54:20.131358",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "#Step One \n",
    "#Install Packages \n",
    "install.packages(\"tidyverse\")\n",
    "install.packages(\"ggplot2\")\n",
    "install.packages(\"lubridate\")\n",
    "library(\"tidyverse\")#helps wrangle the data\n",
    "library(\"lubridate\")#helps wrangle date attributes\n",
    "library(\"ggplot2\")#helps visualize the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "f9e80d8c",
   "metadata": {
    "_cell_guid": "4a739acd-2814-441b-b5bf-04f91caaacc8",
    "_uuid": "4e13fe56-4d9f-48f1-9a91-daafafc0147f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:21.681560Z",
     "iopub.status.busy": "2022-10-25T18:55:21.655804Z",
     "iopub.status.idle": "2022-10-25T18:55:21.698796Z",
     "shell.execute_reply": "2022-10-25T18:55:21.697414Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.051632,
     "end_time": "2022-10-25T18:55:21.701031",
     "exception": false,
     "start_time": "2022-10-25T18:55:21.649399",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'/kaggle/working'"
      ],
      "text/latex": [
       "'/kaggle/working'"
      ],
      "text/markdown": [
       "'/kaggle/working'"
      ],
      "text/plain": [
       "[1] \"/kaggle/working\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Step 2 set file location \n",
    "getwd()\n",
    "setwd('/kaggle/working')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e250d914",
   "metadata": {
    "_cell_guid": "d9afe1d6-7cb2-4553-b974-b511ea689617",
    "_uuid": "cc281e1c-1911-4d8e-95c7-7dbf98a8ad17",
    "papermill": {
     "duration": 0.00531,
     "end_time": "2022-10-25T18:55:21.711661",
     "exception": false,
     "start_time": "2022-10-25T18:55:21.706351",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Prepare**\n",
    "\n",
    "Import data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "39517d8b",
   "metadata": {
    "_cell_guid": "b1d25285-6581-40d3-b399-d9efb766ff35",
    "_uuid": "74133097-ddbe-41a7-bf46-5b9b0c4eea32",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:21.724397Z",
     "iopub.status.busy": "2022-10-25T18:55:21.723111Z",
     "iopub.status.idle": "2022-10-25T18:55:22.299926Z",
     "shell.execute_reply": "2022-10-25T18:55:22.297695Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.586267,
     "end_time": "2022-10-25T18:55:22.302898",
     "exception": false,
     "start_time": "2022-10-25T18:55:21.716631",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m187\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (2): Country/Region, WHO Region\n",
      "\u001b[32mdbl\u001b[39m (13): Confirmed, Deaths, Recovered, Active, New cases, New deaths, New r...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m188\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[32mdbl\u001b[39m  (11): Confirmed, Deaths, Recovered, Active, New cases, New deaths, New ...\n",
      "\u001b[34mdate\u001b[39m  (1): Date\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m209\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m16\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (3): Country/Region, Continent, WHO Region\n",
      "\u001b[32mdbl\u001b[39m (13): Population, TotalCases, NewCases, TotalDeaths, NewDeaths, TotalRec...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m49068\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m10\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (3): Province/State, Country/Region, WHO Region\n",
      "\u001b[32mdbl\u001b[39m  (6): Lat, Long, Confirmed, Deaths, Recovered, Active\n",
      "\u001b[34mdate\u001b[39m (1): Date\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "#Step 3 \n",
    "#upload Data\n",
    "country_wise <- read_csv(\"../input/corona-virus-report/country_wise_latest.csv\")\n",
    "day_wise <- read_csv(\"../input/corona-virus-report/day_wise.csv\")\n",
    "worldometer_data <- read_csv(\"../input/corona-virus-report/worldometer_data.csv\")\n",
    "Long_Lat <-  read_csv(\"../input/corona-virus-report/covid_19_clean_complete.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "07f578af",
   "metadata": {
    "_cell_guid": "941396a9-0b6e-4eeb-a361-9df733953ad6",
    "_uuid": "390a6894-3c6c-46d2-9693-6c89e67d0639",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.317457Z",
     "iopub.status.busy": "2022-10-25T18:55:22.316258Z",
     "iopub.status.idle": "2022-10-25T18:55:22.468002Z",
     "shell.execute_reply": "2022-10-25T18:55:22.466136Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.161392,
     "end_time": "2022-10-25T18:55:22.470383",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.308991",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spec_tbl_df [187 × 15] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ Country/Region        : chr [1:187] \"Afghanistan\" \"Albania\" \"Algeria\" \"Andorra\" ...\n",
      " $ Confirmed             : num [1:187] 36263 4880 27973 907 950 ...\n",
      " $ Deaths                : num [1:187] 1269 144 1163 52 41 ...\n",
      " $ Recovered             : num [1:187] 25198 2745 18837 803 242 ...\n",
      " $ Active                : num [1:187] 9796 1991 7973 52 667 ...\n",
      " $ New cases             : num [1:187] 106 117 616 10 18 4 4890 73 368 86 ...\n",
      " $ New deaths            : num [1:187] 10 6 8 0 1 0 120 6 6 1 ...\n",
      " $ New recovered         : num [1:187] 18 63 749 0 0 ...\n",
      " $ Deaths / 100 Cases    : num [1:187] 3.5 2.95 4.16 5.73 4.32 3.49 1.83 1.9 1.09 3.47 ...\n",
      " $ Recovered / 100 Cases : num [1:187] 69.5 56.2 67.3 88.5 25.5 ...\n",
      " $ Deaths / 100 Recovered: num [1:187] 5.04 5.25 6.17 6.48 16.94 ...\n",
      " $ Confirmed last week   : num [1:187] 35526 4171 23691 884 749 ...\n",
      " $ 1 week change         : num [1:187] 737 709 4282 23 201 ...\n",
      " $ 1 week % increase     : num [1:187] 2.07 17 18.07 2.6 26.84 ...\n",
      " $ WHO Region            : chr [1:187] \"Eastern Mediterranean\" \"Europe\" \"Africa\" \"Europe\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   `Country/Region` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   Confirmed = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Deaths = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Recovered = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Active = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `New cases` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `New deaths` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `New recovered` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Deaths / 100 Cases` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Recovered / 100 Cases` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Deaths / 100 Recovered` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Confirmed last week` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `1 week change` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `1 week % increase` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `WHO Region` = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spec_tbl_df [49,068 × 10] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ Province/State: chr [1:49068] NA NA NA NA ...\n",
      " $ Country/Region: chr [1:49068] \"Afghanistan\" \"Albania\" \"Algeria\" \"Andorra\" ...\n",
      " $ Lat           : num [1:49068] 33.9 41.2 28 42.5 -11.2 ...\n",
      " $ Long          : num [1:49068] 67.71 20.17 1.66 1.52 17.87 ...\n",
      " $ Date          : Date[1:49068], format: \"2020-01-22\" \"2020-01-22\" ...\n",
      " $ Confirmed     : num [1:49068] 0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ Deaths        : num [1:49068] 0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ Recovered     : num [1:49068] 0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ Active        : num [1:49068] 0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ WHO Region    : chr [1:49068] \"Eastern Mediterranean\" \"Europe\" \"Africa\" \"Europe\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   `Province/State` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Country/Region` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   Lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Long = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Date = \u001b[34mcol_date(format = \"\")\u001b[39m,\n",
      "  ..   Confirmed = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Deaths = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Recovered = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Active = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `WHO Region` = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spec_tbl_df [188 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ Date                  : Date[1:188], format: \"2020-01-22\" \"2020-01-23\" ...\n",
      " $ Confirmed             : num [1:188] 555 654 941 1434 2118 ...\n",
      " $ Deaths                : num [1:188] 17 18 26 42 56 82 131 133 171 213 ...\n",
      " $ Recovered             : num [1:188] 28 30 36 39 52 61 107 125 141 219 ...\n",
      " $ Active                : num [1:188] 510 606 879 1353 2010 ...\n",
      " $ New cases             : num [1:188] 0 99 287 493 684 ...\n",
      " $ New deaths            : num [1:188] 0 1 8 16 14 26 49 2 38 42 ...\n",
      " $ New recovered         : num [1:188] 0 2 6 3 13 9 46 18 16 78 ...\n",
      " $ Deaths / 100 Cases    : num [1:188] 3.06 2.75 2.76 2.93 2.64 2.8 2.35 2.16 2.08 2.15 ...\n",
      " $ Recovered / 100 Cases : num [1:188] 5.05 4.59 3.83 2.72 2.46 2.08 1.92 2.03 1.71 2.21 ...\n",
      " $ Deaths / 100 Recovered: num [1:188] 60.7 60 72.2 107.7 107.7 ...\n",
      " $ No. of countries      : num [1:188] 6 8 9 11 13 16 16 18 20 24 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   Date = \u001b[34mcol_date(format = \"\")\u001b[39m,\n",
      "  ..   Confirmed = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Deaths = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Recovered = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Active = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `New cases` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `New deaths` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `New recovered` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Deaths / 100 Cases` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Recovered / 100 Cases` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Deaths / 100 Recovered` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `No. of countries` = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spec_tbl_df [209 × 16] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ Country/Region  : chr [1:209] \"USA\" \"Brazil\" \"India\" \"Russia\" ...\n",
      " $ Continent       : chr [1:209] \"North America\" \"South America\" \"Asia\" \"Europe\" ...\n",
      " $ Population      : num [1:209] 3.31e+08 2.13e+08 1.38e+09 1.46e+08 5.94e+07 ...\n",
      " $ TotalCases      : num [1:209] 5032179 2917562 2025409 871894 538184 ...\n",
      " $ NewCases        : num [1:209] NA NA NA NA NA 6590 NA NA NA NA ...\n",
      " $ TotalDeaths     : num [1:209] 162804 98644 41638 14606 9604 ...\n",
      " $ NewDeaths       : num [1:209] NA NA NA NA NA 819 NA NA NA NA ...\n",
      " $ TotalRecovered  : num [1:209] 2576668 2047660 1377384 676357 387316 ...\n",
      " $ NewRecovered    : num [1:209] NA NA NA NA NA 4140 NA NA NA NA ...\n",
      " $ ActiveCases     : num [1:209] 2292707 771258 606387 180931 141264 ...\n",
      " $ Serious,Critical: num [1:209] 18296 8318 8944 2300 539 ...\n",
      " $ Tot Cases/1M pop: num [1:209] 15194 13716 1466 5974 9063 ...\n",
      " $ Deaths/1M pop   : num [1:209] 492 464 30 100 162 391 619 517 234 610 ...\n",
      " $ TotalTests      : num [1:209] 63139605 13206188 22149351 29716907 3149807 ...\n",
      " $ Tests/1M pop    : num [1:209] 190640 62085 16035 203623 53044 ...\n",
      " $ WHO Region      : chr [1:209] \"Americas\" \"Americas\" \"South-EastAsia\" \"Europe\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   `Country/Region` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   Continent = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   Population = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   TotalCases = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   NewCases = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   TotalDeaths = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   NewDeaths = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   TotalRecovered = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   NewRecovered = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   ActiveCases = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Serious,Critical` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Tot Cases/1M pop` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Deaths/1M pop` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   TotalTests = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `Tests/1M pop` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `WHO Region` = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Country/Region</th><th scope=col>Confirmed</th><th scope=col>Deaths</th><th scope=col>Recovered</th><th scope=col>Active</th><th scope=col>New cases</th><th scope=col>New deaths</th><th scope=col>New recovered</th><th scope=col>Deaths / 100 Cases</th><th scope=col>Recovered / 100 Cases</th><th scope=col>Deaths / 100 Recovered</th><th scope=col>Confirmed last week</th><th scope=col>1 week change</th><th scope=col>1 week % increase</th><th scope=col>WHO Region</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Afghanistan        </td><td>36263</td><td>1269</td><td>25198</td><td>9796</td><td>106</td><td>10</td><td> 18</td><td>3.50</td><td>69.49</td><td> 5.04</td><td>35526</td><td> 737</td><td> 2.07</td><td>Eastern Mediterranean</td></tr>\n",
       "\t<tr><td>Albania            </td><td> 4880</td><td> 144</td><td> 2745</td><td>1991</td><td>117</td><td> 6</td><td> 63</td><td>2.95</td><td>56.25</td><td> 5.25</td><td> 4171</td><td> 709</td><td>17.00</td><td>Europe               </td></tr>\n",
       "\t<tr><td>Algeria            </td><td>27973</td><td>1163</td><td>18837</td><td>7973</td><td>616</td><td> 8</td><td>749</td><td>4.16</td><td>67.34</td><td> 6.17</td><td>23691</td><td>4282</td><td>18.07</td><td>Africa               </td></tr>\n",
       "\t<tr><td>Andorra            </td><td>  907</td><td>  52</td><td>  803</td><td>  52</td><td> 10</td><td> 0</td><td>  0</td><td>5.73</td><td>88.53</td><td> 6.48</td><td>  884</td><td>  23</td><td> 2.60</td><td>Europe               </td></tr>\n",
       "\t<tr><td>Angola             </td><td>  950</td><td>  41</td><td>  242</td><td> 667</td><td> 18</td><td> 1</td><td>  0</td><td>4.32</td><td>25.47</td><td>16.94</td><td>  749</td><td> 201</td><td>26.84</td><td>Africa               </td></tr>\n",
       "\t<tr><td>Antigua and Barbuda</td><td>   86</td><td>   3</td><td>   65</td><td>  18</td><td>  4</td><td> 0</td><td>  5</td><td>3.49</td><td>75.58</td><td> 4.62</td><td>   76</td><td>  10</td><td>13.16</td><td>Americas             </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " Country/Region & Confirmed & Deaths & Recovered & Active & New cases & New deaths & New recovered & Deaths / 100 Cases & Recovered / 100 Cases & Deaths / 100 Recovered & Confirmed last week & 1 week change & 1 week \\% increase & WHO Region\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Afghanistan         & 36263 & 1269 & 25198 & 9796 & 106 & 10 &  18 & 3.50 & 69.49 &  5.04 & 35526 &  737 &  2.07 & Eastern Mediterranean\\\\\n",
       "\t Albania             &  4880 &  144 &  2745 & 1991 & 117 &  6 &  63 & 2.95 & 56.25 &  5.25 &  4171 &  709 & 17.00 & Europe               \\\\\n",
       "\t Algeria             & 27973 & 1163 & 18837 & 7973 & 616 &  8 & 749 & 4.16 & 67.34 &  6.17 & 23691 & 4282 & 18.07 & Africa               \\\\\n",
       "\t Andorra             &   907 &   52 &   803 &   52 &  10 &  0 &   0 & 5.73 & 88.53 &  6.48 &   884 &   23 &  2.60 & Europe               \\\\\n",
       "\t Angola              &   950 &   41 &   242 &  667 &  18 &  1 &   0 & 4.32 & 25.47 & 16.94 &   749 &  201 & 26.84 & Africa               \\\\\n",
       "\t Antigua and Barbuda &    86 &    3 &    65 &   18 &   4 &  0 &   5 & 3.49 & 75.58 &  4.62 &    76 &   10 & 13.16 & Americas             \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| Country/Region &lt;chr&gt; | Confirmed &lt;dbl&gt; | Deaths &lt;dbl&gt; | Recovered &lt;dbl&gt; | Active &lt;dbl&gt; | New cases &lt;dbl&gt; | New deaths &lt;dbl&gt; | New recovered &lt;dbl&gt; | Deaths / 100 Cases &lt;dbl&gt; | Recovered / 100 Cases &lt;dbl&gt; | Deaths / 100 Recovered &lt;dbl&gt; | Confirmed last week &lt;dbl&gt; | 1 week change &lt;dbl&gt; | 1 week % increase &lt;dbl&gt; | WHO Region &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| Afghanistan         | 36263 | 1269 | 25198 | 9796 | 106 | 10 |  18 | 3.50 | 69.49 |  5.04 | 35526 |  737 |  2.07 | Eastern Mediterranean |\n",
       "| Albania             |  4880 |  144 |  2745 | 1991 | 117 |  6 |  63 | 2.95 | 56.25 |  5.25 |  4171 |  709 | 17.00 | Europe                |\n",
       "| Algeria             | 27973 | 1163 | 18837 | 7973 | 616 |  8 | 749 | 4.16 | 67.34 |  6.17 | 23691 | 4282 | 18.07 | Africa                |\n",
       "| Andorra             |   907 |   52 |   803 |   52 |  10 |  0 |   0 | 5.73 | 88.53 |  6.48 |   884 |   23 |  2.60 | Europe                |\n",
       "| Angola              |   950 |   41 |   242 |  667 |  18 |  1 |   0 | 4.32 | 25.47 | 16.94 |   749 |  201 | 26.84 | Africa                |\n",
       "| Antigua and Barbuda |    86 |    3 |    65 |   18 |   4 |  0 |   5 | 3.49 | 75.58 |  4.62 |    76 |   10 | 13.16 | Americas              |\n",
       "\n"
      ],
      "text/plain": [
       "  Country/Region      Confirmed Deaths Recovered Active New cases New deaths\n",
       "1 Afghanistan         36263     1269   25198     9796   106       10        \n",
       "2 Albania              4880      144    2745     1991   117        6        \n",
       "3 Algeria             27973     1163   18837     7973   616        8        \n",
       "4 Andorra               907       52     803       52    10        0        \n",
       "5 Angola                950       41     242      667    18        1        \n",
       "6 Antigua and Barbuda    86        3      65       18     4        0        \n",
       "  New recovered Deaths / 100 Cases Recovered / 100 Cases Deaths / 100 Recovered\n",
       "1  18           3.50               69.49                  5.04                 \n",
       "2  63           2.95               56.25                  5.25                 \n",
       "3 749           4.16               67.34                  6.17                 \n",
       "4   0           5.73               88.53                  6.48                 \n",
       "5   0           4.32               25.47                 16.94                 \n",
       "6   5           3.49               75.58                  4.62                 \n",
       "  Confirmed last week 1 week change 1 week % increase WHO Region           \n",
       "1 35526                737           2.07             Eastern Mediterranean\n",
       "2  4171                709          17.00             Europe               \n",
       "3 23691               4282          18.07             Africa               \n",
       "4   884                 23           2.60             Europe               \n",
       "5   749                201          26.84             Africa               \n",
       "6    76                 10          13.16             Americas             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Province/State</th><th scope=col>Country/Region</th><th scope=col>Lat</th><th scope=col>Long</th><th scope=col>Date</th><th scope=col>Confirmed</th><th scope=col>Deaths</th><th scope=col>Recovered</th><th scope=col>Active</th><th scope=col>WHO Region</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>NA</td><td>Afghanistan        </td><td> 33.93911</td><td> 67.70995</td><td>2020-01-22</td><td>0</td><td>0</td><td>0</td><td>0</td><td>Eastern Mediterranean</td></tr>\n",
       "\t<tr><td>NA</td><td>Albania            </td><td> 41.15330</td><td> 20.16830</td><td>2020-01-22</td><td>0</td><td>0</td><td>0</td><td>0</td><td>Europe               </td></tr>\n",
       "\t<tr><td>NA</td><td>Algeria            </td><td> 28.03390</td><td>  1.65960</td><td>2020-01-22</td><td>0</td><td>0</td><td>0</td><td>0</td><td>Africa               </td></tr>\n",
       "\t<tr><td>NA</td><td>Andorra            </td><td> 42.50630</td><td>  1.52180</td><td>2020-01-22</td><td>0</td><td>0</td><td>0</td><td>0</td><td>Europe               </td></tr>\n",
       "\t<tr><td>NA</td><td>Angola             </td><td>-11.20270</td><td> 17.87390</td><td>2020-01-22</td><td>0</td><td>0</td><td>0</td><td>0</td><td>Africa               </td></tr>\n",
       "\t<tr><td>NA</td><td>Antigua and Barbuda</td><td> 17.06080</td><td>-61.79640</td><td>2020-01-22</td><td>0</td><td>0</td><td>0</td><td>0</td><td>Americas             </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 10\n",
       "\\begin{tabular}{llllllllll}\n",
       " Province/State & Country/Region & Lat & Long & Date & Confirmed & Deaths & Recovered & Active & WHO Region\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl> & <date> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t NA & Afghanistan         &  33.93911 &  67.70995 & 2020-01-22 & 0 & 0 & 0 & 0 & Eastern Mediterranean\\\\\n",
       "\t NA & Albania             &  41.15330 &  20.16830 & 2020-01-22 & 0 & 0 & 0 & 0 & Europe               \\\\\n",
       "\t NA & Algeria             &  28.03390 &   1.65960 & 2020-01-22 & 0 & 0 & 0 & 0 & Africa               \\\\\n",
       "\t NA & Andorra             &  42.50630 &   1.52180 & 2020-01-22 & 0 & 0 & 0 & 0 & Europe               \\\\\n",
       "\t NA & Angola              & -11.20270 &  17.87390 & 2020-01-22 & 0 & 0 & 0 & 0 & Africa               \\\\\n",
       "\t NA & Antigua and Barbuda &  17.06080 & -61.79640 & 2020-01-22 & 0 & 0 & 0 & 0 & Americas             \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 10\n",
       "\n",
       "| Province/State &lt;chr&gt; | Country/Region &lt;chr&gt; | Lat &lt;dbl&gt; | Long &lt;dbl&gt; | Date &lt;date&gt; | Confirmed &lt;dbl&gt; | Deaths &lt;dbl&gt; | Recovered &lt;dbl&gt; | Active &lt;dbl&gt; | WHO Region &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| NA | Afghanistan         |  33.93911 |  67.70995 | 2020-01-22 | 0 | 0 | 0 | 0 | Eastern Mediterranean |\n",
       "| NA | Albania             |  41.15330 |  20.16830 | 2020-01-22 | 0 | 0 | 0 | 0 | Europe                |\n",
       "| NA | Algeria             |  28.03390 |   1.65960 | 2020-01-22 | 0 | 0 | 0 | 0 | Africa                |\n",
       "| NA | Andorra             |  42.50630 |   1.52180 | 2020-01-22 | 0 | 0 | 0 | 0 | Europe                |\n",
       "| NA | Angola              | -11.20270 |  17.87390 | 2020-01-22 | 0 | 0 | 0 | 0 | Africa                |\n",
       "| NA | Antigua and Barbuda |  17.06080 | -61.79640 | 2020-01-22 | 0 | 0 | 0 | 0 | Americas              |\n",
       "\n"
      ],
      "text/plain": [
       "  Province/State Country/Region      Lat       Long      Date       Confirmed\n",
       "1 NA             Afghanistan          33.93911  67.70995 2020-01-22 0        \n",
       "2 NA             Albania              41.15330  20.16830 2020-01-22 0        \n",
       "3 NA             Algeria              28.03390   1.65960 2020-01-22 0        \n",
       "4 NA             Andorra              42.50630   1.52180 2020-01-22 0        \n",
       "5 NA             Angola              -11.20270  17.87390 2020-01-22 0        \n",
       "6 NA             Antigua and Barbuda  17.06080 -61.79640 2020-01-22 0        \n",
       "  Deaths Recovered Active WHO Region           \n",
       "1 0      0         0      Eastern Mediterranean\n",
       "2 0      0         0      Europe               \n",
       "3 0      0         0      Africa               \n",
       "4 0      0         0      Europe               \n",
       "5 0      0         0      Africa               \n",
       "6 0      0         0      Americas             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Date</th><th scope=col>Confirmed</th><th scope=col>Deaths</th><th scope=col>Recovered</th><th scope=col>Active</th><th scope=col>New cases</th><th scope=col>New deaths</th><th scope=col>New recovered</th><th scope=col>Deaths / 100 Cases</th><th scope=col>Recovered / 100 Cases</th><th scope=col>Deaths / 100 Recovered</th><th scope=col>No. of countries</th></tr>\n",
       "\t<tr><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2020-01-22</td><td> 555</td><td>17</td><td>28</td><td> 510</td><td>  0</td><td> 0</td><td> 0</td><td>3.06</td><td>5.05</td><td> 60.71</td><td> 6</td></tr>\n",
       "\t<tr><td>2020-01-23</td><td> 654</td><td>18</td><td>30</td><td> 606</td><td> 99</td><td> 1</td><td> 2</td><td>2.75</td><td>4.59</td><td> 60.00</td><td> 8</td></tr>\n",
       "\t<tr><td>2020-01-24</td><td> 941</td><td>26</td><td>36</td><td> 879</td><td>287</td><td> 8</td><td> 6</td><td>2.76</td><td>3.83</td><td> 72.22</td><td> 9</td></tr>\n",
       "\t<tr><td>2020-01-25</td><td>1434</td><td>42</td><td>39</td><td>1353</td><td>493</td><td>16</td><td> 3</td><td>2.93</td><td>2.72</td><td>107.69</td><td>11</td></tr>\n",
       "\t<tr><td>2020-01-26</td><td>2118</td><td>56</td><td>52</td><td>2010</td><td>684</td><td>14</td><td>13</td><td>2.64</td><td>2.46</td><td>107.69</td><td>13</td></tr>\n",
       "\t<tr><td>2020-01-27</td><td>2927</td><td>82</td><td>61</td><td>2784</td><td>809</td><td>26</td><td> 9</td><td>2.80</td><td>2.08</td><td>134.43</td><td>16</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Date & Confirmed & Deaths & Recovered & Active & New cases & New deaths & New recovered & Deaths / 100 Cases & Recovered / 100 Cases & Deaths / 100 Recovered & No. of countries\\\\\n",
       " <date> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2020-01-22 &  555 & 17 & 28 &  510 &   0 &  0 &  0 & 3.06 & 5.05 &  60.71 &  6\\\\\n",
       "\t 2020-01-23 &  654 & 18 & 30 &  606 &  99 &  1 &  2 & 2.75 & 4.59 &  60.00 &  8\\\\\n",
       "\t 2020-01-24 &  941 & 26 & 36 &  879 & 287 &  8 &  6 & 2.76 & 3.83 &  72.22 &  9\\\\\n",
       "\t 2020-01-25 & 1434 & 42 & 39 & 1353 & 493 & 16 &  3 & 2.93 & 2.72 & 107.69 & 11\\\\\n",
       "\t 2020-01-26 & 2118 & 56 & 52 & 2010 & 684 & 14 & 13 & 2.64 & 2.46 & 107.69 & 13\\\\\n",
       "\t 2020-01-27 & 2927 & 82 & 61 & 2784 & 809 & 26 &  9 & 2.80 & 2.08 & 134.43 & 16\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 12\n",
       "\n",
       "| Date &lt;date&gt; | Confirmed &lt;dbl&gt; | Deaths &lt;dbl&gt; | Recovered &lt;dbl&gt; | Active &lt;dbl&gt; | New cases &lt;dbl&gt; | New deaths &lt;dbl&gt; | New recovered &lt;dbl&gt; | Deaths / 100 Cases &lt;dbl&gt; | Recovered / 100 Cases &lt;dbl&gt; | Deaths / 100 Recovered &lt;dbl&gt; | No. of countries &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 2020-01-22 |  555 | 17 | 28 |  510 |   0 |  0 |  0 | 3.06 | 5.05 |  60.71 |  6 |\n",
       "| 2020-01-23 |  654 | 18 | 30 |  606 |  99 |  1 |  2 | 2.75 | 4.59 |  60.00 |  8 |\n",
       "| 2020-01-24 |  941 | 26 | 36 |  879 | 287 |  8 |  6 | 2.76 | 3.83 |  72.22 |  9 |\n",
       "| 2020-01-25 | 1434 | 42 | 39 | 1353 | 493 | 16 |  3 | 2.93 | 2.72 | 107.69 | 11 |\n",
       "| 2020-01-26 | 2118 | 56 | 52 | 2010 | 684 | 14 | 13 | 2.64 | 2.46 | 107.69 | 13 |\n",
       "| 2020-01-27 | 2927 | 82 | 61 | 2784 | 809 | 26 |  9 | 2.80 | 2.08 | 134.43 | 16 |\n",
       "\n"
      ],
      "text/plain": [
       "  Date       Confirmed Deaths Recovered Active New cases New deaths\n",
       "1 2020-01-22  555      17     28         510     0        0        \n",
       "2 2020-01-23  654      18     30         606    99        1        \n",
       "3 2020-01-24  941      26     36         879   287        8        \n",
       "4 2020-01-25 1434      42     39        1353   493       16        \n",
       "5 2020-01-26 2118      56     52        2010   684       14        \n",
       "6 2020-01-27 2927      82     61        2784   809       26        \n",
       "  New recovered Deaths / 100 Cases Recovered / 100 Cases Deaths / 100 Recovered\n",
       "1  0            3.06               5.05                   60.71                \n",
       "2  2            2.75               4.59                   60.00                \n",
       "3  6            2.76               3.83                   72.22                \n",
       "4  3            2.93               2.72                  107.69                \n",
       "5 13            2.64               2.46                  107.69                \n",
       "6  9            2.80               2.08                  134.43                \n",
       "  No. of countries\n",
       "1  6              \n",
       "2  8              \n",
       "3  9              \n",
       "4 11              \n",
       "5 13              \n",
       "6 16              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 16</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Country/Region</th><th scope=col>Continent</th><th scope=col>Population</th><th scope=col>TotalCases</th><th scope=col>NewCases</th><th scope=col>TotalDeaths</th><th scope=col>NewDeaths</th><th scope=col>TotalRecovered</th><th scope=col>NewRecovered</th><th scope=col>ActiveCases</th><th scope=col>Serious,Critical</th><th scope=col>Tot Cases/1M pop</th><th scope=col>Deaths/1M pop</th><th scope=col>TotalTests</th><th scope=col>Tests/1M pop</th><th scope=col>WHO Region</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>USA         </td><td>North America</td><td> 331198130</td><td>5032179</td><td>  NA</td><td>162804</td><td> NA</td><td>2576668</td><td>  NA</td><td>2292707</td><td>18296</td><td>15194</td><td>492</td><td>63139605</td><td>190640</td><td>Americas      </td></tr>\n",
       "\t<tr><td>Brazil      </td><td>South America</td><td> 212710692</td><td>2917562</td><td>  NA</td><td> 98644</td><td> NA</td><td>2047660</td><td>  NA</td><td> 771258</td><td> 8318</td><td>13716</td><td>464</td><td>13206188</td><td> 62085</td><td>Americas      </td></tr>\n",
       "\t<tr><td>India       </td><td>Asia         </td><td>1381344997</td><td>2025409</td><td>  NA</td><td> 41638</td><td> NA</td><td>1377384</td><td>  NA</td><td> 606387</td><td> 8944</td><td> 1466</td><td> 30</td><td>22149351</td><td> 16035</td><td>South-EastAsia</td></tr>\n",
       "\t<tr><td>Russia      </td><td>Europe       </td><td> 145940924</td><td> 871894</td><td>  NA</td><td> 14606</td><td> NA</td><td> 676357</td><td>  NA</td><td> 180931</td><td> 2300</td><td> 5974</td><td>100</td><td>29716907</td><td>203623</td><td>Europe        </td></tr>\n",
       "\t<tr><td>South Africa</td><td>Africa       </td><td>  59381566</td><td> 538184</td><td>  NA</td><td>  9604</td><td> NA</td><td> 387316</td><td>  NA</td><td> 141264</td><td>  539</td><td> 9063</td><td>162</td><td> 3149807</td><td> 53044</td><td>Africa        </td></tr>\n",
       "\t<tr><td>Mexico      </td><td>North America</td><td> 129066160</td><td> 462690</td><td>6590</td><td> 50517</td><td>819</td><td> 308848</td><td>4140</td><td> 103325</td><td> 3987</td><td> 3585</td><td>391</td><td> 1056915</td><td>  8189</td><td>Americas      </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 16\n",
       "\\begin{tabular}{llllllllllllllll}\n",
       " Country/Region & Continent & Population & TotalCases & NewCases & TotalDeaths & NewDeaths & TotalRecovered & NewRecovered & ActiveCases & Serious,Critical & Tot Cases/1M pop & Deaths/1M pop & TotalTests & Tests/1M pop & WHO Region\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t USA          & North America &  331198130 & 5032179 &   NA & 162804 &  NA & 2576668 &   NA & 2292707 & 18296 & 15194 & 492 & 63139605 & 190640 & Americas      \\\\\n",
       "\t Brazil       & South America &  212710692 & 2917562 &   NA &  98644 &  NA & 2047660 &   NA &  771258 &  8318 & 13716 & 464 & 13206188 &  62085 & Americas      \\\\\n",
       "\t India        & Asia          & 1381344997 & 2025409 &   NA &  41638 &  NA & 1377384 &   NA &  606387 &  8944 &  1466 &  30 & 22149351 &  16035 & South-EastAsia\\\\\n",
       "\t Russia       & Europe        &  145940924 &  871894 &   NA &  14606 &  NA &  676357 &   NA &  180931 &  2300 &  5974 & 100 & 29716907 & 203623 & Europe        \\\\\n",
       "\t South Africa & Africa        &   59381566 &  538184 &   NA &   9604 &  NA &  387316 &   NA &  141264 &   539 &  9063 & 162 &  3149807 &  53044 & Africa        \\\\\n",
       "\t Mexico       & North America &  129066160 &  462690 & 6590 &  50517 & 819 &  308848 & 4140 &  103325 &  3987 &  3585 & 391 &  1056915 &   8189 & Americas      \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 16\n",
       "\n",
       "| Country/Region &lt;chr&gt; | Continent &lt;chr&gt; | Population &lt;dbl&gt; | TotalCases &lt;dbl&gt; | NewCases &lt;dbl&gt; | TotalDeaths &lt;dbl&gt; | NewDeaths &lt;dbl&gt; | TotalRecovered &lt;dbl&gt; | NewRecovered &lt;dbl&gt; | ActiveCases &lt;dbl&gt; | Serious,Critical &lt;dbl&gt; | Tot Cases/1M pop &lt;dbl&gt; | Deaths/1M pop &lt;dbl&gt; | TotalTests &lt;dbl&gt; | Tests/1M pop &lt;dbl&gt; | WHO Region &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| USA          | North America |  331198130 | 5032179 |   NA | 162804 |  NA | 2576668 |   NA | 2292707 | 18296 | 15194 | 492 | 63139605 | 190640 | Americas       |\n",
       "| Brazil       | South America |  212710692 | 2917562 |   NA |  98644 |  NA | 2047660 |   NA |  771258 |  8318 | 13716 | 464 | 13206188 |  62085 | Americas       |\n",
       "| India        | Asia          | 1381344997 | 2025409 |   NA |  41638 |  NA | 1377384 |   NA |  606387 |  8944 |  1466 |  30 | 22149351 |  16035 | South-EastAsia |\n",
       "| Russia       | Europe        |  145940924 |  871894 |   NA |  14606 |  NA |  676357 |   NA |  180931 |  2300 |  5974 | 100 | 29716907 | 203623 | Europe         |\n",
       "| South Africa | Africa        |   59381566 |  538184 |   NA |   9604 |  NA |  387316 |   NA |  141264 |   539 |  9063 | 162 |  3149807 |  53044 | Africa         |\n",
       "| Mexico       | North America |  129066160 |  462690 | 6590 |  50517 | 819 |  308848 | 4140 |  103325 |  3987 |  3585 | 391 |  1056915 |   8189 | Americas       |\n",
       "\n"
      ],
      "text/plain": [
       "  Country/Region Continent     Population TotalCases NewCases TotalDeaths\n",
       "1 USA            North America  331198130 5032179      NA     162804     \n",
       "2 Brazil         South America  212710692 2917562      NA      98644     \n",
       "3 India          Asia          1381344997 2025409      NA      41638     \n",
       "4 Russia         Europe         145940924  871894      NA      14606     \n",
       "5 South Africa   Africa          59381566  538184      NA       9604     \n",
       "6 Mexico         North America  129066160  462690    6590      50517     \n",
       "  NewDeaths TotalRecovered NewRecovered ActiveCases Serious,Critical\n",
       "1  NA       2576668          NA         2292707     18296           \n",
       "2  NA       2047660          NA          771258      8318           \n",
       "3  NA       1377384          NA          606387      8944           \n",
       "4  NA        676357          NA          180931      2300           \n",
       "5  NA        387316          NA          141264       539           \n",
       "6 819        308848        4140          103325      3987           \n",
       "  Tot Cases/1M pop Deaths/1M pop TotalTests Tests/1M pop WHO Region    \n",
       "1 15194            492           63139605   190640       Americas      \n",
       "2 13716            464           13206188    62085       Americas      \n",
       "3  1466             30           22149351    16035       South-EastAsia\n",
       "4  5974            100           29716907   203623       Europe        \n",
       "5  9063            162            3149807    53044       Africa        \n",
       "6  3585            391            1056915     8189       Americas      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Step 4: Clean Data and wrangle data \n",
    "# Inspect the dataframes and look for incongruencies\n",
    "str(country_wise)\n",
    "str(Long_Lat)\n",
    "str(day_wise)\n",
    "str(worldometer_data)\n",
    "#Inspect the headers of every data frame \n",
    "head(country_wise)\n",
    "head(Long_Lat)\n",
    "head(day_wise)\n",
    "head(worldometer_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "f1a19e0d",
   "metadata": {
    "_cell_guid": "e6022860-0b1d-4c7f-922c-1b2b04f771d8",
    "_uuid": "25fb75f9-1572-498b-82ae-11ebefdf3904",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.487139Z",
     "iopub.status.busy": "2022-10-25T18:55:22.485913Z",
     "iopub.status.idle": "2022-10-25T18:55:22.515106Z",
     "shell.execute_reply": "2022-10-25T18:55:22.513579Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.039633,
     "end_time": "2022-10-25T18:55:22.517359",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.477726",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "187"
      ],
      "text/latex": [
       "187"
      ],
      "text/markdown": [
       "187"
      ],
      "text/plain": [
       "[1] 187"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "49068"
      ],
      "text/latex": [
       "49068"
      ],
      "text/markdown": [
       "49068"
      ],
      "text/plain": [
       "[1] 49068"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "188"
      ],
      "text/latex": [
       "188"
      ],
      "text/markdown": [
       "188"
      ],
      "text/plain": [
       "[1] 188"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "209"
      ],
      "text/latex": [
       "209"
      ],
      "text/markdown": [
       "209"
      ],
      "text/plain": [
       "[1] 209"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Number of rows\n",
    "nrow(country_wise)\n",
    "nrow(Long_Lat)\n",
    "nrow(day_wise)\n",
    "nrow(worldometer_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "55d2828f",
   "metadata": {
    "_cell_guid": "7450652a-cbf2-41dc-baf3-27f3839dd460",
    "_uuid": "2be858bc-2bcd-44b6-8eec-e0b551af9739",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.534607Z",
     "iopub.status.busy": "2022-10-25T18:55:22.533438Z",
     "iopub.status.idle": "2022-10-25T18:55:22.563600Z",
     "shell.execute_reply": "2022-10-25T18:55:22.562098Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.041388,
     "end_time": "2022-10-25T18:55:22.566131",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.524743",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>187</li><li>15</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 187\n",
       "\\item 15\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 187\n",
       "2. 15\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 187  15"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>49068</li><li>10</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 49068\n",
       "\\item 10\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 49068\n",
       "2. 10\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 49068    10"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>188</li><li>12</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 188\n",
       "\\item 12\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 188\n",
       "2. 12\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 188  12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>209</li><li>16</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 209\n",
       "\\item 16\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 209\n",
       "2. 16\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 209  16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#dim() function in R Language\n",
    "#is used to get or set the dimension of the specified matrix, array or data frame.\n",
    "dim(country_wise)\n",
    "dim(Long_Lat)\n",
    "dim(day_wise)\n",
    "dim(worldometer_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b2f3e42f",
   "metadata": {
    "_cell_guid": "ca698a7a-406d-4678-a66b-ca3d80efc398",
    "_uuid": "b81bdf7e-56f9-4029-8280-d036118dd997",
    "papermill": {
     "duration": 0.00784,
     "end_time": "2022-10-25T18:55:22.582157",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.574317",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Analayze\n",
    "\n",
    "Performing descriptive analysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "9c477098",
   "metadata": {
    "_cell_guid": "78b4af0e-faf4-4d7c-ac8e-411f689a7ee0",
    "_uuid": "220d42b6-89aa-47a8-a24a-99248d20678d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.606357Z",
     "iopub.status.busy": "2022-10-25T18:55:22.605027Z",
     "iopub.status.idle": "2022-10-25T18:55:22.626184Z",
     "shell.execute_reply": "2022-10-25T18:55:22.624677Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.038439,
     "end_time": "2022-10-25T18:55:22.628422",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.589983",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       " Country/Region       Confirmed           Deaths           Recovered        \n",
       " Length:187         Min.   :     10   Min.   :     0.0   Min.   :      0.0  \n",
       " Class :character   1st Qu.:   1114   1st Qu.:    18.5   1st Qu.:    626.5  \n",
       " Mode  :character   Median :   5059   Median :   108.0   Median :   2815.0  \n",
       "                    Mean   :  88131   Mean   :  3497.5   Mean   :  50631.5  \n",
       "                    3rd Qu.:  40460   3rd Qu.:   734.0   3rd Qu.:  22606.0  \n",
       "                    Max.   :4290259   Max.   :148011.0   Max.   :1846641.0  \n",
       "     Active            New cases         New deaths      New recovered    \n",
       " Min.   :      0.0   Min.   :    0.0   Min.   :   0.00   Min.   :    0.0  \n",
       " 1st Qu.:    141.5   1st Qu.:    4.0   1st Qu.:   0.00   1st Qu.:    0.0  \n",
       " Median :   1600.0   Median :   49.0   Median :   1.00   Median :   22.0  \n",
       " Mean   :  34001.9   Mean   : 1223.0   Mean   :  28.96   Mean   :  933.8  \n",
       " 3rd Qu.:   9149.0   3rd Qu.:  419.5   3rd Qu.:   6.00   3rd Qu.:  221.0  \n",
       " Max.   :2816444.0   Max.   :56336.0   Max.   :1076.00   Max.   :33728.0  \n",
       " Deaths / 100 Cases Recovered / 100 Cases Deaths / 100 Recovered\n",
       " Min.   : 0.000     Min.   :  0.00        Min.   :0.00          \n",
       " 1st Qu.: 0.945     1st Qu.: 48.77        1st Qu.:1.45          \n",
       " Median : 2.150     Median : 71.32        Median :3.62          \n",
       " Mean   : 3.020     Mean   : 64.82        Mean   : Inf          \n",
       " 3rd Qu.: 3.875     3rd Qu.: 86.89        3rd Qu.:6.44          \n",
       " Max.   :28.560     Max.   :100.00        Max.   : Inf          \n",
       " Confirmed last week 1 week change    1 week % increase  WHO Region       \n",
       " Min.   :     10     Min.   :   -47   Min.   : -3.840   Length:187        \n",
       " 1st Qu.:   1052     1st Qu.:    49   1st Qu.:  2.775   Class :character  \n",
       " Median :   5020     Median :   432   Median :  6.890   Mode  :character  \n",
       " Mean   :  78682     Mean   :  9448   Mean   : 13.606                     \n",
       " 3rd Qu.:  37080     3rd Qu.:  3172   3rd Qu.: 16.855                     \n",
       " Max.   :3834677     Max.   :455582   Max.   :226.320                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(country_wise)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "075d3d2f",
   "metadata": {
    "_cell_guid": "5dcd5680-fe16-495b-9f44-7a00b4f74986",
    "_uuid": "8b4f001b-62ad-46d1-80d2-c99ca8d61f4b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.647146Z",
     "iopub.status.busy": "2022-10-25T18:55:22.645911Z",
     "iopub.status.idle": "2022-10-25T18:55:22.670755Z",
     "shell.execute_reply": "2022-10-25T18:55:22.669377Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.036709,
     "end_time": "2022-10-25T18:55:22.673102",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.636393",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "      Date              Confirmed            Deaths         Recovered      \n",
       " Min.   :2020-01-22   Min.   :     555   Min.   :    17   Min.   :     28  \n",
       " 1st Qu.:2020-03-08   1st Qu.:  112191   1st Qu.:  3935   1st Qu.:  60441  \n",
       " Median :2020-04-24   Median : 2848733   Median :204190   Median : 784784  \n",
       " Mean   :2020-04-24   Mean   : 4406960   Mean   :230771   Mean   :2066001  \n",
       " 3rd Qu.:2020-06-10   3rd Qu.: 7422046   3rd Qu.:418634   3rd Qu.:3416396  \n",
       " Max.   :2020-07-27   Max.   :16480485   Max.   :654036   Max.   :9468087  \n",
       "     Active          New cases        New deaths     New recovered   \n",
       " Min.   :    510   Min.   :     0   Min.   :   0.0   Min.   :     0  \n",
       " 1st Qu.:  58642   1st Qu.:  5568   1st Qu.: 250.8   1st Qu.:  2488  \n",
       " Median :1859759   Median : 81114   Median :4116.0   Median : 30992  \n",
       " Mean   :2110188   Mean   : 87771   Mean   :3478.8   Mean   : 50362  \n",
       " 3rd Qu.:3587015   3rd Qu.:131502   3rd Qu.:5346.0   3rd Qu.: 79706  \n",
       " Max.   :6358362   Max.   :282756   Max.   :9966.0   Max.   :284394  \n",
       " Deaths / 100 Cases Recovered / 100 Cases Deaths / 100 Recovered\n",
       " Min.   :2.040      Min.   : 1.71         Min.   :  6.26        \n",
       " 1st Qu.:3.510      1st Qu.:22.79         1st Qu.:  9.65        \n",
       " Median :4.850      Median :35.68         Median : 15.38        \n",
       " Mean   :4.861      Mean   :34.34         Mean   : 22.10        \n",
       " 3rd Qu.:6.298      3rd Qu.:48.95         3rd Qu.: 25.34        \n",
       " Max.   :7.180      Max.   :57.45         Max.   :134.43        \n",
       " No. of countries\n",
       " Min.   :  6.0   \n",
       " 1st Qu.:101.2   \n",
       " Median :184.0   \n",
       " Mean   :144.4   \n",
       " 3rd Qu.:187.0   \n",
       " Max.   :187.0   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(day_wise)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "1f18f15a",
   "metadata": {
    "_cell_guid": "377cf1d8-934a-41c0-abc5-af4f574b6147",
    "_uuid": "7579a2e8-f3b2-4f29-80bc-a97c24dab6d8",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.693086Z",
     "iopub.status.busy": "2022-10-25T18:55:22.691816Z",
     "iopub.status.idle": "2022-10-25T18:55:22.726473Z",
     "shell.execute_reply": "2022-10-25T18:55:22.724745Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.047342,
     "end_time": "2022-10-25T18:55:22.728868",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.681526",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       " Province/State     Country/Region          Lat               Long        \n",
       " Length:49068       Length:49068       Min.   :-51.796   Min.   :-135.00  \n",
       " Class :character   Class :character   1st Qu.:  7.873   1st Qu.: -15.31  \n",
       " Mode  :character   Mode  :character   Median : 23.634   Median :  21.75  \n",
       "                                       Mean   : 21.434   Mean   :  23.53  \n",
       "                                       3rd Qu.: 41.204   3rd Qu.:  80.77  \n",
       "                                       Max.   : 71.707   Max.   : 178.06  \n",
       "      Date              Confirmed           Deaths           Recovered      \n",
       " Min.   :2020-01-22   Min.   :      0   Min.   :     0.0   Min.   :      0  \n",
       " 1st Qu.:2020-03-08   1st Qu.:      4   1st Qu.:     0.0   1st Qu.:      0  \n",
       " Median :2020-04-24   Median :    168   Median :     2.0   Median :     29  \n",
       " Mean   :2020-04-24   Mean   :  16885   Mean   :   884.2   Mean   :   7916  \n",
       " 3rd Qu.:2020-06-10   3rd Qu.:   1518   3rd Qu.:    30.0   3rd Qu.:    666  \n",
       " Max.   :2020-07-27   Max.   :4290259   Max.   :148011.0   Max.   :1846641  \n",
       "     Active         WHO Region       \n",
       " Min.   :    -14   Length:49068      \n",
       " 1st Qu.:      0   Class :character  \n",
       " Median :     26   Mode  :character  \n",
       " Mean   :   8085                     \n",
       " 3rd Qu.:    606                     \n",
       " Max.   :2816444                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(Long_Lat)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "4c20c443",
   "metadata": {
    "_cell_guid": "1799db6b-6363-4230-9b4f-174441d25cea",
    "_uuid": "800fb2cd-6c8b-4881-845a-70e3d4b850df",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.748702Z",
     "iopub.status.busy": "2022-10-25T18:55:22.747532Z",
     "iopub.status.idle": "2022-10-25T18:55:22.766778Z",
     "shell.execute_reply": "2022-10-25T18:55:22.765146Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.031521,
     "end_time": "2022-10-25T18:55:22.769034",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.737513",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       " Country/Region      Continent           Population          TotalCases     \n",
       " Length:209         Length:209         Min.   :8.010e+02   Min.   :     10  \n",
       " Class :character   Class :character   1st Qu.:9.663e+05   1st Qu.:    712  \n",
       " Mode  :character   Mode  :character   Median :7.042e+06   Median :   4491  \n",
       "                                       Mean   :3.042e+07   Mean   :  91718  \n",
       "                                       3rd Qu.:2.576e+07   3rd Qu.:  36896  \n",
       "                                       Max.   :1.381e+09   Max.   :5032179  \n",
       "                                       NA's   :1                            \n",
       "    NewCases       TotalDeaths       NewDeaths     TotalRecovered   \n",
       " Min.   :  20.0   Min.   :     1   Min.   :  1.0   Min.   :      7  \n",
       " 1st Qu.:  27.5   1st Qu.:    22   1st Qu.: 40.5   1st Qu.:    334  \n",
       " Median : 656.0   Median :   113   Median : 80.0   Median :   2178  \n",
       " Mean   :1980.5   Mean   :  3793   Mean   :300.0   Mean   :  58879  \n",
       " 3rd Qu.:2609.0   3rd Qu.:   786   3rd Qu.:449.5   3rd Qu.:  20553  \n",
       " Max.   :6590.0   Max.   :162804   Max.   :819.0   Max.   :2576668  \n",
       " NA's   :205      NA's   :21       NA's   :206     NA's   :4        \n",
       "  NewRecovered   ActiveCases      Serious,Critical   Tot Cases/1M pop\n",
       " Min.   :  42   Min.   :      0   Min.   :    1.00   Min.   :    3   \n",
       " 1st Qu.: 489   1st Qu.:     86   1st Qu.:    3.25   1st Qu.:  282   \n",
       " Median : 936   Median :    899   Median :   27.50   Median : 1015   \n",
       " Mean   :1706   Mean   :  27664   Mean   :  534.39   Mean   : 3196   \n",
       " 3rd Qu.:2538   3rd Qu.:   7124   3rd Qu.:  160.25   3rd Qu.: 3842   \n",
       " Max.   :4140   Max.   :2292707   Max.   :18296.00   Max.   :39922   \n",
       " NA's   :206    NA's   :4         NA's   :87         NA's   :1       \n",
       " Deaths/1M pop       TotalTests        Tests/1M pop     WHO Region       \n",
       " Min.   :   0.08   Min.   :      61   Min.   :     4   Length:209        \n",
       " 1st Qu.:   6.00   1st Qu.:   25752   1st Qu.:  8956   Class :character  \n",
       " Median :  29.00   Median :  135702   Median : 32585   Mode  :character  \n",
       " Mean   :  98.68   Mean   : 1402405   Mean   : 83959                     \n",
       " 3rd Qu.:  98.00   3rd Qu.:  757696   3rd Qu.: 92154                     \n",
       " Max.   :1238.00   Max.   :63139605   Max.   :995282                     \n",
       " NA's   :22        NA's   :18         NA's   :18                         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(worldometer_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "c102f746",
   "metadata": {
    "_cell_guid": "c37b7ec1-a71c-48b4-b22d-7176f43ae6d1",
    "_uuid": "078e66bb-9ed9-4bc3-8c06-1a0685e1e444",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.789012Z",
     "iopub.status.busy": "2022-10-25T18:55:22.787692Z",
     "iopub.status.idle": "2022-10-25T18:55:22.824639Z",
     "shell.execute_reply": "2022-10-25T18:55:22.822717Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.049551,
     "end_time": "2022-10-25T18:55:22.826998",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.777447",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 18</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Date</th><th scope=col>Confirmed</th><th scope=col>Deaths</th><th scope=col>Recovered</th><th scope=col>Active</th><th scope=col>New cases</th><th scope=col>New deaths</th><th scope=col>New recovered</th><th scope=col>Deaths / 100 Cases</th><th scope=col>Recovered / 100 Cases</th><th scope=col>Deaths / 100 Recovered</th><th scope=col>No. of countries</th><th scope=col>date</th><th scope=col>month</th><th scope=col>MonthName</th><th scope=col>day</th><th scope=col>year</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2020-01-22</td><td> 555</td><td>17</td><td>28</td><td> 510</td><td>  0</td><td> 0</td><td> 0</td><td>3.06</td><td>5.05</td><td> 60.71</td><td> 6</td><td>2020-01-22</td><td>01</td><td>Jan</td><td>22</td><td>2020</td><td>Wednesday</td></tr>\n",
       "\t<tr><td>2020-01-23</td><td> 654</td><td>18</td><td>30</td><td> 606</td><td> 99</td><td> 1</td><td> 2</td><td>2.75</td><td>4.59</td><td> 60.00</td><td> 8</td><td>2020-01-23</td><td>01</td><td>Jan</td><td>23</td><td>2020</td><td>Thursday </td></tr>\n",
       "\t<tr><td>2020-01-24</td><td> 941</td><td>26</td><td>36</td><td> 879</td><td>287</td><td> 8</td><td> 6</td><td>2.76</td><td>3.83</td><td> 72.22</td><td> 9</td><td>2020-01-24</td><td>01</td><td>Jan</td><td>24</td><td>2020</td><td>Friday   </td></tr>\n",
       "\t<tr><td>2020-01-25</td><td>1434</td><td>42</td><td>39</td><td>1353</td><td>493</td><td>16</td><td> 3</td><td>2.93</td><td>2.72</td><td>107.69</td><td>11</td><td>2020-01-25</td><td>01</td><td>Jan</td><td>25</td><td>2020</td><td>Saturday </td></tr>\n",
       "\t<tr><td>2020-01-26</td><td>2118</td><td>56</td><td>52</td><td>2010</td><td>684</td><td>14</td><td>13</td><td>2.64</td><td>2.46</td><td>107.69</td><td>13</td><td>2020-01-26</td><td>01</td><td>Jan</td><td>26</td><td>2020</td><td>Sunday   </td></tr>\n",
       "\t<tr><td>2020-01-27</td><td>2927</td><td>82</td><td>61</td><td>2784</td><td>809</td><td>26</td><td> 9</td><td>2.80</td><td>2.08</td><td>134.43</td><td>16</td><td>2020-01-27</td><td>01</td><td>Jan</td><td>27</td><td>2020</td><td>Monday   </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 18\n",
       "\\begin{tabular}{llllllllllllllllll}\n",
       " Date & Confirmed & Deaths & Recovered & Active & New cases & New deaths & New recovered & Deaths / 100 Cases & Recovered / 100 Cases & Deaths / 100 Recovered & No. of countries & date & month & MonthName & day & year & day\\_of\\_week\\\\\n",
       " <date> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <date> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 2020-01-22 &  555 & 17 & 28 &  510 &   0 &  0 &  0 & 3.06 & 5.05 &  60.71 &  6 & 2020-01-22 & 01 & Jan & 22 & 2020 & Wednesday\\\\\n",
       "\t 2020-01-23 &  654 & 18 & 30 &  606 &  99 &  1 &  2 & 2.75 & 4.59 &  60.00 &  8 & 2020-01-23 & 01 & Jan & 23 & 2020 & Thursday \\\\\n",
       "\t 2020-01-24 &  941 & 26 & 36 &  879 & 287 &  8 &  6 & 2.76 & 3.83 &  72.22 &  9 & 2020-01-24 & 01 & Jan & 24 & 2020 & Friday   \\\\\n",
       "\t 2020-01-25 & 1434 & 42 & 39 & 1353 & 493 & 16 &  3 & 2.93 & 2.72 & 107.69 & 11 & 2020-01-25 & 01 & Jan & 25 & 2020 & Saturday \\\\\n",
       "\t 2020-01-26 & 2118 & 56 & 52 & 2010 & 684 & 14 & 13 & 2.64 & 2.46 & 107.69 & 13 & 2020-01-26 & 01 & Jan & 26 & 2020 & Sunday   \\\\\n",
       "\t 2020-01-27 & 2927 & 82 & 61 & 2784 & 809 & 26 &  9 & 2.80 & 2.08 & 134.43 & 16 & 2020-01-27 & 01 & Jan & 27 & 2020 & Monday   \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 18\n",
       "\n",
       "| Date &lt;date&gt; | Confirmed &lt;dbl&gt; | Deaths &lt;dbl&gt; | Recovered &lt;dbl&gt; | Active &lt;dbl&gt; | New cases &lt;dbl&gt; | New deaths &lt;dbl&gt; | New recovered &lt;dbl&gt; | Deaths / 100 Cases &lt;dbl&gt; | Recovered / 100 Cases &lt;dbl&gt; | Deaths / 100 Recovered &lt;dbl&gt; | No. of countries &lt;dbl&gt; | date &lt;date&gt; | month &lt;chr&gt; | MonthName &lt;chr&gt; | day &lt;chr&gt; | year &lt;chr&gt; | day_of_week &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 2020-01-22 |  555 | 17 | 28 |  510 |   0 |  0 |  0 | 3.06 | 5.05 |  60.71 |  6 | 2020-01-22 | 01 | Jan | 22 | 2020 | Wednesday |\n",
       "| 2020-01-23 |  654 | 18 | 30 |  606 |  99 |  1 |  2 | 2.75 | 4.59 |  60.00 |  8 | 2020-01-23 | 01 | Jan | 23 | 2020 | Thursday  |\n",
       "| 2020-01-24 |  941 | 26 | 36 |  879 | 287 |  8 |  6 | 2.76 | 3.83 |  72.22 |  9 | 2020-01-24 | 01 | Jan | 24 | 2020 | Friday    |\n",
       "| 2020-01-25 | 1434 | 42 | 39 | 1353 | 493 | 16 |  3 | 2.93 | 2.72 | 107.69 | 11 | 2020-01-25 | 01 | Jan | 25 | 2020 | Saturday  |\n",
       "| 2020-01-26 | 2118 | 56 | 52 | 2010 | 684 | 14 | 13 | 2.64 | 2.46 | 107.69 | 13 | 2020-01-26 | 01 | Jan | 26 | 2020 | Sunday    |\n",
       "| 2020-01-27 | 2927 | 82 | 61 | 2784 | 809 | 26 |  9 | 2.80 | 2.08 | 134.43 | 16 | 2020-01-27 | 01 | Jan | 27 | 2020 | Monday    |\n",
       "\n"
      ],
      "text/plain": [
       "  Date       Confirmed Deaths Recovered Active New cases New deaths\n",
       "1 2020-01-22  555      17     28         510     0        0        \n",
       "2 2020-01-23  654      18     30         606    99        1        \n",
       "3 2020-01-24  941      26     36         879   287        8        \n",
       "4 2020-01-25 1434      42     39        1353   493       16        \n",
       "5 2020-01-26 2118      56     52        2010   684       14        \n",
       "6 2020-01-27 2927      82     61        2784   809       26        \n",
       "  New recovered Deaths / 100 Cases Recovered / 100 Cases Deaths / 100 Recovered\n",
       "1  0            3.06               5.05                   60.71                \n",
       "2  2            2.75               4.59                   60.00                \n",
       "3  6            2.76               3.83                   72.22                \n",
       "4  3            2.93               2.72                  107.69                \n",
       "5 13            2.64               2.46                  107.69                \n",
       "6  9            2.80               2.08                  134.43                \n",
       "  No. of countries date       month MonthName day year day_of_week\n",
       "1  6               2020-01-22 01    Jan       22  2020 Wednesday  \n",
       "2  8               2020-01-23 01    Jan       23  2020 Thursday   \n",
       "3  9               2020-01-24 01    Jan       24  2020 Friday     \n",
       "4 11               2020-01-25 01    Jan       25  2020 Saturday   \n",
       "5 13               2020-01-26 01    Jan       26  2020 Sunday     \n",
       "6 16               2020-01-27 01    Jan       27  2020 Monday     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#working with day_wise dataset\n",
    "#Add columns that list date,month,day and year , #The default format is yyyy-mm-dd\n",
    "day_wise$date <- as.Date(day_wise$Date) \n",
    "day_wise$month <- format(as.Date(day_wise$date), \"%m\")\n",
    "day_wise$MonthName <- format(day_wise$date, \"%b\")\n",
    "day_wise$day <- format(as.Date(day_wise$date), \"%d\")\n",
    "day_wise$year <- format(as.Date(day_wise$date), \"%Y\")\n",
    "day_wise$day_of_week <- format(as.Date(day_wise$date), \"%A\")\n",
    "\n",
    "head(day_wise)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "9fbc7a51",
   "metadata": {
    "_cell_guid": "2ebb6f9f-34f9-4b82-b71a-b5deade01f4c",
    "_uuid": "0149f1af-5afa-4b7e-8af1-f1c24fc3c668",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.847489Z",
     "iopub.status.busy": "2022-10-25T18:55:22.846204Z",
     "iopub.status.idle": "2022-10-25T18:55:22.877816Z",
     "shell.execute_reply": "2022-10-25T18:55:22.875840Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.044222,
     "end_time": "2022-10-25T18:55:22.880156",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.835934",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>day_wise$MonthName</th><th scope=col>day_wise$Confirmed</th><th scope=col>day_wise$Recovered</th><th scope=col>day_wise$Deaths</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Jan</td><td> 555</td><td>28</td><td>17</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>Jan</td><td> 654</td><td>30</td><td>18</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>Jan</td><td> 941</td><td>36</td><td>26</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>Jan</td><td>1434</td><td>39</td><td>42</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>Jan</td><td>2118</td><td>52</td><td>56</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>Jan</td><td>2927</td><td>61</td><td>82</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 4\n",
       "\\begin{tabular}{r|llll}\n",
       "  & day\\_wise\\$MonthName & day\\_wise\\$Confirmed & day\\_wise\\$Recovered & day\\_wise\\$Deaths\\\\\n",
       "  & <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & Jan &  555 & 28 & 17\\\\\n",
       "\t2 & Jan &  654 & 30 & 18\\\\\n",
       "\t3 & Jan &  941 & 36 & 26\\\\\n",
       "\t4 & Jan & 1434 & 39 & 42\\\\\n",
       "\t5 & Jan & 2118 & 52 & 56\\\\\n",
       "\t6 & Jan & 2927 & 61 & 82\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 4\n",
       "\n",
       "| <!--/--> | day_wise$MonthName &lt;chr&gt; | day_wise$Confirmed &lt;dbl&gt; | day_wise$Recovered &lt;dbl&gt; | day_wise$Deaths &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1 | Jan |  555 | 28 | 17 |\n",
       "| 2 | Jan |  654 | 30 | 18 |\n",
       "| 3 | Jan |  941 | 36 | 26 |\n",
       "| 4 | Jan | 1434 | 39 | 42 |\n",
       "| 5 | Jan | 2118 | 52 | 56 |\n",
       "| 6 | Jan | 2927 | 61 | 82 |\n",
       "\n"
      ],
      "text/plain": [
       "  day_wise$MonthName day_wise$Confirmed day_wise$Recovered day_wise$Deaths\n",
       "1 Jan                 555               28                 17             \n",
       "2 Jan                 654               30                 18             \n",
       "3 Jan                 941               36                 26             \n",
       "4 Jan                1434               39                 42             \n",
       "5 Jan                2118               52                 56             \n",
       "6 Jan                2927               61                 82             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Get the average number of all variables every month \n",
    "\n",
    "Average_data <- aggregate(day_wise$Deaths ~ day_wise$MonthName + day_wise$Confirmed + day_wise$Recovered, FUN = mean) \n",
    "head(Average_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "305f8157",
   "metadata": {
    "_cell_guid": "80ad08a4-ea12-43d5-aee8-fbd3171181c3",
    "_uuid": "4804eaa7-53f5-4fce-9008-c257046b3809",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.901192Z",
     "iopub.status.busy": "2022-10-25T18:55:22.899908Z",
     "iopub.status.idle": "2022-10-25T18:55:22.968030Z",
     "shell.execute_reply": "2022-10-25T18:55:22.966181Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.080822,
     "end_time": "2022-10-25T18:55:22.970371",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.889549",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'day_wise$MonthName'</li><li>'day_wise$Confirmed'</li><li>'day_wise$Recovered'</li><li>'day_wise$Deaths'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'day\\_wise\\$MonthName'\n",
       "\\item 'day\\_wise\\$Confirmed'\n",
       "\\item 'day\\_wise\\$Recovered'\n",
       "\\item 'day\\_wise\\$Deaths'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'day_wise$MonthName'\n",
       "2. 'day_wise$Confirmed'\n",
       "3. 'day_wise$Recovered'\n",
       "4. 'day_wise$Deaths'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"day_wise$MonthName\" \"day_wise$Confirmed\" \"day_wise$Recovered\"\n",
       "[4] \"day_wise$Deaths\"   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 188 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Month</th><th scope=col>confirmed</th><th scope=col>recovered</th><th scope=col>deaths</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Jan</td><td>  555</td><td>   28</td><td>  17</td></tr>\n",
       "\t<tr><td>Jan</td><td>  654</td><td>   30</td><td>  18</td></tr>\n",
       "\t<tr><td>Jan</td><td>  941</td><td>   36</td><td>  26</td></tr>\n",
       "\t<tr><td>Jan</td><td> 1434</td><td>   39</td><td>  42</td></tr>\n",
       "\t<tr><td>Jan</td><td> 2118</td><td>   52</td><td>  56</td></tr>\n",
       "\t<tr><td>Jan</td><td> 2927</td><td>   61</td><td>  82</td></tr>\n",
       "\t<tr><td>Jan</td><td> 5578</td><td>  107</td><td> 131</td></tr>\n",
       "\t<tr><td>Jan</td><td> 6166</td><td>  125</td><td> 133</td></tr>\n",
       "\t<tr><td>Jan</td><td> 8234</td><td>  141</td><td> 171</td></tr>\n",
       "\t<tr><td>Jan</td><td> 9927</td><td>  219</td><td> 213</td></tr>\n",
       "\t<tr><td>Feb</td><td>12038</td><td>  281</td><td> 259</td></tr>\n",
       "\t<tr><td>Feb</td><td>16787</td><td>  459</td><td> 362</td></tr>\n",
       "\t<tr><td>Feb</td><td>19887</td><td>  604</td><td> 426</td></tr>\n",
       "\t<tr><td>Feb</td><td>23898</td><td>  821</td><td> 492</td></tr>\n",
       "\t<tr><td>Feb</td><td>27643</td><td> 1071</td><td> 564</td></tr>\n",
       "\t<tr><td>Feb</td><td>30802</td><td> 1418</td><td> 634</td></tr>\n",
       "\t<tr><td>Feb</td><td>34334</td><td> 1903</td><td> 719</td></tr>\n",
       "\t<tr><td>Feb</td><td>37068</td><td> 2470</td><td> 806</td></tr>\n",
       "\t<tr><td>Feb</td><td>40095</td><td> 3057</td><td> 906</td></tr>\n",
       "\t<tr><td>Feb</td><td>42633</td><td> 3714</td><td>1013</td></tr>\n",
       "\t<tr><td>Feb</td><td>44675</td><td> 4417</td><td>1113</td></tr>\n",
       "\t<tr><td>Feb</td><td>46561</td><td> 4849</td><td>1118</td></tr>\n",
       "\t<tr><td>Feb</td><td>60206</td><td> 5930</td><td>1371</td></tr>\n",
       "\t<tr><td>Feb</td><td>66690</td><td> 7613</td><td>1523</td></tr>\n",
       "\t<tr><td>Feb</td><td>68765</td><td> 8902</td><td>1666</td></tr>\n",
       "\t<tr><td>Feb</td><td>70879</td><td>10319</td><td>1770</td></tr>\n",
       "\t<tr><td>Feb</td><td>72815</td><td>11951</td><td>1868</td></tr>\n",
       "\t<tr><td>Feb</td><td>74609</td><td>13693</td><td>2008</td></tr>\n",
       "\t<tr><td>Feb</td><td>75030</td><td>15394</td><td>2123</td></tr>\n",
       "\t<tr><td>Feb</td><td>75577</td><td>17369</td><td>2246</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>Jun</td><td>10117227</td><td>5070592</td><td>502357</td></tr>\n",
       "\t<tr><td>Jun</td><td>10275799</td><td>5164494</td><td>506078</td></tr>\n",
       "\t<tr><td>Jun</td><td>10449697</td><td>5281459</td><td>511210</td></tr>\n",
       "\t<tr><td>Jul</td><td>10667386</td><td>5397083</td><td>516221</td></tr>\n",
       "\t<tr><td>Jul</td><td>10875091</td><td>5681477</td><td>521341</td></tr>\n",
       "\t<tr><td>Jul</td><td>11078585</td><td>5790942</td><td>526336</td></tr>\n",
       "\t<tr><td>Jul</td><td>11272152</td><td>5986375</td><td>530705</td></tr>\n",
       "\t<tr><td>Jul</td><td>11454847</td><td>6105546</td><td>534150</td></tr>\n",
       "\t<tr><td>Jul</td><td>11622190</td><td>6228768</td><td>537947</td></tr>\n",
       "\t<tr><td>Jul</td><td>11833034</td><td>6373513</td><td>544054</td></tr>\n",
       "\t<tr><td>Jul</td><td>12044836</td><td>6531016</td><td>549373</td></tr>\n",
       "\t<tr><td>Jul</td><td>12273063</td><td>6665237</td><td>554831</td></tr>\n",
       "\t<tr><td>Jul</td><td>12505640</td><td>6804254</td><td>560142</td></tr>\n",
       "\t<tr><td>Jul</td><td>12721968</td><td>6929711</td><td>565039</td></tr>\n",
       "\t<tr><td>Jul</td><td>12914636</td><td>7041174</td><td>568993</td></tr>\n",
       "\t<tr><td>Jul</td><td>13107415</td><td>7181139</td><td>572808</td></tr>\n",
       "\t<tr><td>Jul</td><td>13328867</td><td>7322897</td><td>578468</td></tr>\n",
       "\t<tr><td>Jul</td><td>13559984</td><td>7482320</td><td>583961</td></tr>\n",
       "\t<tr><td>Jul</td><td>13812525</td><td>7634241</td><td>589760</td></tr>\n",
       "\t<tr><td>Jul</td><td>14054563</td><td>7793760</td><td>596503</td></tr>\n",
       "\t<tr><td>Jul</td><td>14292198</td><td>7944550</td><td>602130</td></tr>\n",
       "\t<tr><td>Jul</td><td>14506845</td><td>8032235</td><td>606159</td></tr>\n",
       "\t<tr><td>Jul</td><td>14713623</td><td>8190777</td><td>610319</td></tr>\n",
       "\t<tr><td>Jul</td><td>14947078</td><td>8364986</td><td>616557</td></tr>\n",
       "\t<tr><td>Jul</td><td>15227725</td><td>8541255</td><td>623540</td></tr>\n",
       "\t<tr><td>Jul</td><td>15510481</td><td>8710969</td><td>633506</td></tr>\n",
       "\t<tr><td>Jul</td><td>15791645</td><td>8939705</td><td>639650</td></tr>\n",
       "\t<tr><td>Jul</td><td>16047190</td><td>9158743</td><td>644517</td></tr>\n",
       "\t<tr><td>Jul</td><td>16251796</td><td>9293464</td><td>648621</td></tr>\n",
       "\t<tr><td>Jul</td><td>16480485</td><td>9468087</td><td>654036</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 188 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Month & confirmed & recovered & deaths\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Jan &   555 &    28 &   17\\\\\n",
       "\t Jan &   654 &    30 &   18\\\\\n",
       "\t Jan &   941 &    36 &   26\\\\\n",
       "\t Jan &  1434 &    39 &   42\\\\\n",
       "\t Jan &  2118 &    52 &   56\\\\\n",
       "\t Jan &  2927 &    61 &   82\\\\\n",
       "\t Jan &  5578 &   107 &  131\\\\\n",
       "\t Jan &  6166 &   125 &  133\\\\\n",
       "\t Jan &  8234 &   141 &  171\\\\\n",
       "\t Jan &  9927 &   219 &  213\\\\\n",
       "\t Feb & 12038 &   281 &  259\\\\\n",
       "\t Feb & 16787 &   459 &  362\\\\\n",
       "\t Feb & 19887 &   604 &  426\\\\\n",
       "\t Feb & 23898 &   821 &  492\\\\\n",
       "\t Feb & 27643 &  1071 &  564\\\\\n",
       "\t Feb & 30802 &  1418 &  634\\\\\n",
       "\t Feb & 34334 &  1903 &  719\\\\\n",
       "\t Feb & 37068 &  2470 &  806\\\\\n",
       "\t Feb & 40095 &  3057 &  906\\\\\n",
       "\t Feb & 42633 &  3714 & 1013\\\\\n",
       "\t Feb & 44675 &  4417 & 1113\\\\\n",
       "\t Feb & 46561 &  4849 & 1118\\\\\n",
       "\t Feb & 60206 &  5930 & 1371\\\\\n",
       "\t Feb & 66690 &  7613 & 1523\\\\\n",
       "\t Feb & 68765 &  8902 & 1666\\\\\n",
       "\t Feb & 70879 & 10319 & 1770\\\\\n",
       "\t Feb & 72815 & 11951 & 1868\\\\\n",
       "\t Feb & 74609 & 13693 & 2008\\\\\n",
       "\t Feb & 75030 & 15394 & 2123\\\\\n",
       "\t Feb & 75577 & 17369 & 2246\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t Jun & 10117227 & 5070592 & 502357\\\\\n",
       "\t Jun & 10275799 & 5164494 & 506078\\\\\n",
       "\t Jun & 10449697 & 5281459 & 511210\\\\\n",
       "\t Jul & 10667386 & 5397083 & 516221\\\\\n",
       "\t Jul & 10875091 & 5681477 & 521341\\\\\n",
       "\t Jul & 11078585 & 5790942 & 526336\\\\\n",
       "\t Jul & 11272152 & 5986375 & 530705\\\\\n",
       "\t Jul & 11454847 & 6105546 & 534150\\\\\n",
       "\t Jul & 11622190 & 6228768 & 537947\\\\\n",
       "\t Jul & 11833034 & 6373513 & 544054\\\\\n",
       "\t Jul & 12044836 & 6531016 & 549373\\\\\n",
       "\t Jul & 12273063 & 6665237 & 554831\\\\\n",
       "\t Jul & 12505640 & 6804254 & 560142\\\\\n",
       "\t Jul & 12721968 & 6929711 & 565039\\\\\n",
       "\t Jul & 12914636 & 7041174 & 568993\\\\\n",
       "\t Jul & 13107415 & 7181139 & 572808\\\\\n",
       "\t Jul & 13328867 & 7322897 & 578468\\\\\n",
       "\t Jul & 13559984 & 7482320 & 583961\\\\\n",
       "\t Jul & 13812525 & 7634241 & 589760\\\\\n",
       "\t Jul & 14054563 & 7793760 & 596503\\\\\n",
       "\t Jul & 14292198 & 7944550 & 602130\\\\\n",
       "\t Jul & 14506845 & 8032235 & 606159\\\\\n",
       "\t Jul & 14713623 & 8190777 & 610319\\\\\n",
       "\t Jul & 14947078 & 8364986 & 616557\\\\\n",
       "\t Jul & 15227725 & 8541255 & 623540\\\\\n",
       "\t Jul & 15510481 & 8710969 & 633506\\\\\n",
       "\t Jul & 15791645 & 8939705 & 639650\\\\\n",
       "\t Jul & 16047190 & 9158743 & 644517\\\\\n",
       "\t Jul & 16251796 & 9293464 & 648621\\\\\n",
       "\t Jul & 16480485 & 9468087 & 654036\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 188 × 4\n",
       "\n",
       "| Month &lt;chr&gt; | confirmed &lt;dbl&gt; | recovered &lt;dbl&gt; | deaths &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Jan |   555 |    28 |   17 |\n",
       "| Jan |   654 |    30 |   18 |\n",
       "| Jan |   941 |    36 |   26 |\n",
       "| Jan |  1434 |    39 |   42 |\n",
       "| Jan |  2118 |    52 |   56 |\n",
       "| Jan |  2927 |    61 |   82 |\n",
       "| Jan |  5578 |   107 |  131 |\n",
       "| Jan |  6166 |   125 |  133 |\n",
       "| Jan |  8234 |   141 |  171 |\n",
       "| Jan |  9927 |   219 |  213 |\n",
       "| Feb | 12038 |   281 |  259 |\n",
       "| Feb | 16787 |   459 |  362 |\n",
       "| Feb | 19887 |   604 |  426 |\n",
       "| Feb | 23898 |   821 |  492 |\n",
       "| Feb | 27643 |  1071 |  564 |\n",
       "| Feb | 30802 |  1418 |  634 |\n",
       "| Feb | 34334 |  1903 |  719 |\n",
       "| Feb | 37068 |  2470 |  806 |\n",
       "| Feb | 40095 |  3057 |  906 |\n",
       "| Feb | 42633 |  3714 | 1013 |\n",
       "| Feb | 44675 |  4417 | 1113 |\n",
       "| Feb | 46561 |  4849 | 1118 |\n",
       "| Feb | 60206 |  5930 | 1371 |\n",
       "| Feb | 66690 |  7613 | 1523 |\n",
       "| Feb | 68765 |  8902 | 1666 |\n",
       "| Feb | 70879 | 10319 | 1770 |\n",
       "| Feb | 72815 | 11951 | 1868 |\n",
       "| Feb | 74609 | 13693 | 2008 |\n",
       "| Feb | 75030 | 15394 | 2123 |\n",
       "| Feb | 75577 | 17369 | 2246 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| Jun | 10117227 | 5070592 | 502357 |\n",
       "| Jun | 10275799 | 5164494 | 506078 |\n",
       "| Jun | 10449697 | 5281459 | 511210 |\n",
       "| Jul | 10667386 | 5397083 | 516221 |\n",
       "| Jul | 10875091 | 5681477 | 521341 |\n",
       "| Jul | 11078585 | 5790942 | 526336 |\n",
       "| Jul | 11272152 | 5986375 | 530705 |\n",
       "| Jul | 11454847 | 6105546 | 534150 |\n",
       "| Jul | 11622190 | 6228768 | 537947 |\n",
       "| Jul | 11833034 | 6373513 | 544054 |\n",
       "| Jul | 12044836 | 6531016 | 549373 |\n",
       "| Jul | 12273063 | 6665237 | 554831 |\n",
       "| Jul | 12505640 | 6804254 | 560142 |\n",
       "| Jul | 12721968 | 6929711 | 565039 |\n",
       "| Jul | 12914636 | 7041174 | 568993 |\n",
       "| Jul | 13107415 | 7181139 | 572808 |\n",
       "| Jul | 13328867 | 7322897 | 578468 |\n",
       "| Jul | 13559984 | 7482320 | 583961 |\n",
       "| Jul | 13812525 | 7634241 | 589760 |\n",
       "| Jul | 14054563 | 7793760 | 596503 |\n",
       "| Jul | 14292198 | 7944550 | 602130 |\n",
       "| Jul | 14506845 | 8032235 | 606159 |\n",
       "| Jul | 14713623 | 8190777 | 610319 |\n",
       "| Jul | 14947078 | 8364986 | 616557 |\n",
       "| Jul | 15227725 | 8541255 | 623540 |\n",
       "| Jul | 15510481 | 8710969 | 633506 |\n",
       "| Jul | 15791645 | 8939705 | 639650 |\n",
       "| Jul | 16047190 | 9158743 | 644517 |\n",
       "| Jul | 16251796 | 9293464 | 648621 |\n",
       "| Jul | 16480485 | 9468087 | 654036 |\n",
       "\n"
      ],
      "text/plain": [
       "    Month confirmed recovered deaths\n",
       "1   Jan     555        28       17  \n",
       "2   Jan     654        30       18  \n",
       "3   Jan     941        36       26  \n",
       "4   Jan    1434        39       42  \n",
       "5   Jan    2118        52       56  \n",
       "6   Jan    2927        61       82  \n",
       "7   Jan    5578       107      131  \n",
       "8   Jan    6166       125      133  \n",
       "9   Jan    8234       141      171  \n",
       "10  Jan    9927       219      213  \n",
       "11  Feb   12038       281      259  \n",
       "12  Feb   16787       459      362  \n",
       "13  Feb   19887       604      426  \n",
       "14  Feb   23898       821      492  \n",
       "15  Feb   27643      1071      564  \n",
       "16  Feb   30802      1418      634  \n",
       "17  Feb   34334      1903      719  \n",
       "18  Feb   37068      2470      806  \n",
       "19  Feb   40095      3057      906  \n",
       "20  Feb   42633      3714     1013  \n",
       "21  Feb   44675      4417     1113  \n",
       "22  Feb   46561      4849     1118  \n",
       "23  Feb   60206      5930     1371  \n",
       "24  Feb   66690      7613     1523  \n",
       "25  Feb   68765      8902     1666  \n",
       "26  Feb   70879     10319     1770  \n",
       "27  Feb   72815     11951     1868  \n",
       "28  Feb   74609     13693     2008  \n",
       "29  Feb   75030     15394     2123  \n",
       "30  Feb   75577     17369     2246  \n",
       "⋮   ⋮     ⋮         ⋮         ⋮     \n",
       "159 Jun   10117227  5070592   502357\n",
       "160 Jun   10275799  5164494   506078\n",
       "161 Jun   10449697  5281459   511210\n",
       "162 Jul   10667386  5397083   516221\n",
       "163 Jul   10875091  5681477   521341\n",
       "164 Jul   11078585  5790942   526336\n",
       "165 Jul   11272152  5986375   530705\n",
       "166 Jul   11454847  6105546   534150\n",
       "167 Jul   11622190  6228768   537947\n",
       "168 Jul   11833034  6373513   544054\n",
       "169 Jul   12044836  6531016   549373\n",
       "170 Jul   12273063  6665237   554831\n",
       "171 Jul   12505640  6804254   560142\n",
       "172 Jul   12721968  6929711   565039\n",
       "173 Jul   12914636  7041174   568993\n",
       "174 Jul   13107415  7181139   572808\n",
       "175 Jul   13328867  7322897   578468\n",
       "176 Jul   13559984  7482320   583961\n",
       "177 Jul   13812525  7634241   589760\n",
       "178 Jul   14054563  7793760   596503\n",
       "179 Jul   14292198  7944550   602130\n",
       "180 Jul   14506845  8032235   606159\n",
       "181 Jul   14713623  8190777   610319\n",
       "182 Jul   14947078  8364986   616557\n",
       "183 Jul   15227725  8541255   623540\n",
       "184 Jul   15510481  8710969   633506\n",
       "185 Jul   15791645  8939705   639650\n",
       "186 Jul   16047190  9158743   644517\n",
       "187 Jul   16251796  9293464   648621\n",
       "188 Jul   16480485  9468087   654036"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#change column names \n",
    "colnames(Average_data)\n",
    "colnames(Average_data) <- c(\"Month\", \"confirmed\", \"recovered\", \"deaths\")\n",
    "View(Average_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "38b6f6c2",
   "metadata": {
    "_cell_guid": "3c785519-b0e6-46ff-9adf-bc96627c5bbc",
    "_uuid": "23e73a15-f0be-4335-b7b2-d71afa45cdbd",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:22.992953Z",
     "iopub.status.busy": "2022-10-25T18:55:22.991521Z",
     "iopub.status.idle": "2022-10-25T18:55:23.049699Z",
     "shell.execute_reply": "2022-10-25T18:55:23.048091Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.07211,
     "end_time": "2022-10-25T18:55:23.052044",
     "exception": false,
     "start_time": "2022-10-25T18:55:22.979934",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Month</th><th scope=col>confirmed</th><th scope=col>recovered</th><th scope=col>deaths</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Apr</td><td> 2113055.4</td><td> 531467.33</td><td>143707.133</td></tr>\n",
       "\t<tr><td>Feb</td><td>   57359.9</td><td>  12540.31</td><td>  1616.379</td></tr>\n",
       "\t<tr><td>Jan</td><td>    3853.4</td><td>     83.80</td><td>    88.900</td></tr>\n",
       "\t<tr><td>Jul</td><td>13440587.0</td><td>7392378.67</td><td>581839.519</td></tr>\n",
       "\t<tr><td>Jun</td><td> 8217526.2</td><td>3899475.60</td><td>443635.100</td></tr>\n",
       "\t<tr><td>Mar</td><td>  290413.4</td><td>  85302.32</td><td> 12825.839</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Month & confirmed & recovered & deaths\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Apr &  2113055.4 &  531467.33 & 143707.133\\\\\n",
       "\t Feb &    57359.9 &   12540.31 &   1616.379\\\\\n",
       "\t Jan &     3853.4 &      83.80 &     88.900\\\\\n",
       "\t Jul & 13440587.0 & 7392378.67 & 581839.519\\\\\n",
       "\t Jun &  8217526.2 & 3899475.60 & 443635.100\\\\\n",
       "\t Mar &   290413.4 &   85302.32 &  12825.839\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| Month &lt;chr&gt; | confirmed &lt;dbl&gt; | recovered &lt;dbl&gt; | deaths &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Apr |  2113055.4 |  531467.33 | 143707.133 |\n",
       "| Feb |    57359.9 |   12540.31 |   1616.379 |\n",
       "| Jan |     3853.4 |      83.80 |     88.900 |\n",
       "| Jul | 13440587.0 | 7392378.67 | 581839.519 |\n",
       "| Jun |  8217526.2 | 3899475.60 | 443635.100 |\n",
       "| Mar |   290413.4 |   85302.32 |  12825.839 |\n",
       "\n"
      ],
      "text/plain": [
       "  Month confirmed  recovered  deaths    \n",
       "1 Apr    2113055.4  531467.33 143707.133\n",
       "2 Feb      57359.9   12540.31   1616.379\n",
       "3 Jan       3853.4      83.80     88.900\n",
       "4 Jul   13440587.0 7392378.67 581839.519\n",
       "5 Jun    8217526.2 3899475.60 443635.100\n",
       "6 Mar     290413.4   85302.32  12825.839"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 7 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Month</th><th scope=col>confirmed</th><th scope=col>recovered</th><th scope=col>deaths</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Apr</td><td> 2113055.4</td><td> 531467.33</td><td>143707.133</td></tr>\n",
       "\t<tr><td>Feb</td><td>   57359.9</td><td>  12540.31</td><td>  1616.379</td></tr>\n",
       "\t<tr><td>Jan</td><td>    3853.4</td><td>     83.80</td><td>    88.900</td></tr>\n",
       "\t<tr><td>Jul</td><td>13440587.0</td><td>7392378.67</td><td>581839.519</td></tr>\n",
       "\t<tr><td>Jun</td><td> 8217526.2</td><td>3899475.60</td><td>443635.100</td></tr>\n",
       "\t<tr><td>Mar</td><td>  290413.4</td><td>  85302.32</td><td> 12825.839</td></tr>\n",
       "\t<tr><td>May</td><td> 4677109.6</td><td>1705704.45</td><td>309987.226</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 7 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Month & confirmed & recovered & deaths\\\\\n",
       " <ord> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Apr &  2113055.4 &  531467.33 & 143707.133\\\\\n",
       "\t Feb &    57359.9 &   12540.31 &   1616.379\\\\\n",
       "\t Jan &     3853.4 &      83.80 &     88.900\\\\\n",
       "\t Jul & 13440587.0 & 7392378.67 & 581839.519\\\\\n",
       "\t Jun &  8217526.2 & 3899475.60 & 443635.100\\\\\n",
       "\t Mar &   290413.4 &   85302.32 &  12825.839\\\\\n",
       "\t May &  4677109.6 & 1705704.45 & 309987.226\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 7 × 4\n",
       "\n",
       "| Month &lt;ord&gt; | confirmed &lt;dbl&gt; | recovered &lt;dbl&gt; | deaths &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Apr |  2113055.4 |  531467.33 | 143707.133 |\n",
       "| Feb |    57359.9 |   12540.31 |   1616.379 |\n",
       "| Jan |     3853.4 |      83.80 |     88.900 |\n",
       "| Jul | 13440587.0 | 7392378.67 | 581839.519 |\n",
       "| Jun |  8217526.2 | 3899475.60 | 443635.100 |\n",
       "| Mar |   290413.4 |   85302.32 |  12825.839 |\n",
       "| May |  4677109.6 | 1705704.45 | 309987.226 |\n",
       "\n"
      ],
      "text/plain": [
       "  Month confirmed  recovered  deaths    \n",
       "1 Apr    2113055.4  531467.33 143707.133\n",
       "2 Feb      57359.9   12540.31   1616.379\n",
       "3 Jan       3853.4      83.80     88.900\n",
       "4 Jul   13440587.0 7392378.67 581839.519\n",
       "5 Jun    8217526.2 3899475.60 443635.100\n",
       "6 Mar     290413.4   85302.32  12825.839\n",
       "7 May    4677109.6 1705704.45 309987.226"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#analyze ruser data by type and weekday\n",
    "Average_data <- Average_data %>% \n",
    "  group_by(Month) %>% #groups by usertype and weekday\n",
    "  summarise_all(mean) # calculates the average duration\n",
    "\n",
    "head(Average_data)\n",
    "\n",
    "Average_data$Month <- ordered(Average_data$Month,levels = c(\"Jan\", \"Feb\", \"Mar\", \"Apr\", \"May\", \"Jun\", \"Jul\"))\n",
    "\n",
    "View(Average_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "1d930d7c",
   "metadata": {
    "_cell_guid": "94c806a6-2320-4aeb-8d28-e1ece857939c",
    "_uuid": "7d0d8917-4e5e-4e4f-9706-8f41bdf24378",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:23.075295Z",
     "iopub.status.busy": "2022-10-25T18:55:23.073966Z",
     "iopub.status.idle": "2022-10-25T18:55:23.095230Z",
     "shell.execute_reply": "2022-10-25T18:55:23.093602Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.035386,
     "end_time": "2022-10-25T18:55:23.097603",
     "exception": false,
     "start_time": "2022-10-25T18:55:23.062217",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 7 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Month</th><th scope=col>confirmed</th><th scope=col>recovered</th><th scope=col>deaths</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Apr</td><td> 2113055.4</td><td> 531467.33</td><td>143707.133</td></tr>\n",
       "\t<tr><td>Feb</td><td>   57359.9</td><td>  12540.31</td><td>  1616.379</td></tr>\n",
       "\t<tr><td>Jan</td><td>    3853.4</td><td>     83.80</td><td>    88.900</td></tr>\n",
       "\t<tr><td>Jul</td><td>13440587.0</td><td>7392378.67</td><td>581839.519</td></tr>\n",
       "\t<tr><td>Jun</td><td> 8217526.2</td><td>3899475.60</td><td>443635.100</td></tr>\n",
       "\t<tr><td>Mar</td><td>  290413.4</td><td>  85302.32</td><td> 12825.839</td></tr>\n",
       "\t<tr><td>May</td><td> 4677109.6</td><td>1705704.45</td><td>309987.226</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 7 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Month & confirmed & recovered & deaths\\\\\n",
       " <ord> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Apr &  2113055.4 &  531467.33 & 143707.133\\\\\n",
       "\t Feb &    57359.9 &   12540.31 &   1616.379\\\\\n",
       "\t Jan &     3853.4 &      83.80 &     88.900\\\\\n",
       "\t Jul & 13440587.0 & 7392378.67 & 581839.519\\\\\n",
       "\t Jun &  8217526.2 & 3899475.60 & 443635.100\\\\\n",
       "\t Mar &   290413.4 &   85302.32 &  12825.839\\\\\n",
       "\t May &  4677109.6 & 1705704.45 & 309987.226\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 7 × 4\n",
       "\n",
       "| Month &lt;ord&gt; | confirmed &lt;dbl&gt; | recovered &lt;dbl&gt; | deaths &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Apr |  2113055.4 |  531467.33 | 143707.133 |\n",
       "| Feb |    57359.9 |   12540.31 |   1616.379 |\n",
       "| Jan |     3853.4 |      83.80 |     88.900 |\n",
       "| Jul | 13440587.0 | 7392378.67 | 581839.519 |\n",
       "| Jun |  8217526.2 | 3899475.60 | 443635.100 |\n",
       "| Mar |   290413.4 |   85302.32 |  12825.839 |\n",
       "| May |  4677109.6 | 1705704.45 | 309987.226 |\n",
       "\n"
      ],
      "text/plain": [
       "  Month confirmed  recovered  deaths    \n",
       "1 Apr    2113055.4  531467.33 143707.133\n",
       "2 Feb      57359.9   12540.31   1616.379\n",
       "3 Jan       3853.4      83.80     88.900\n",
       "4 Jul   13440587.0 7392378.67 581839.519\n",
       "5 Jun    8217526.2 3899475.60 443635.100\n",
       "6 Mar     290413.4   85302.32  12825.839\n",
       "7 May    4677109.6 1705704.45 309987.226"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "View(Average_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6a117057",
   "metadata": {
    "_cell_guid": "ba816344-7786-4f06-9d14-34737bdad857",
    "_uuid": "cf685574-b787-4bb1-aa90-e07044434be5",
    "papermill": {
     "duration": 0.010032,
     "end_time": "2022-10-25T18:55:23.117715",
     "exception": false,
     "start_time": "2022-10-25T18:55:23.107683",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Visualize"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "d3433e1b",
   "metadata": {
    "_cell_guid": "ba93181a-1cb1-47d6-8632-44b0333c711b",
    "_uuid": "23d9125d-97fc-43e6-bf91-ea898a387f80",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:23.140589Z",
     "iopub.status.busy": "2022-10-25T18:55:23.139178Z",
     "iopub.status.idle": "2022-10-25T18:55:23.564552Z",
     "shell.execute_reply": "2022-10-25T18:55:23.553086Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.439565,
     "end_time": "2022-10-25T18:55:23.567127",
     "exception": false,
     "start_time": "2022-10-25T18:55:23.127562",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\ntF27ds1ONQoAAICCKu4cu+ztHz37ef4TT91SdKPfm/7e9PH9+/S6ucdtDz468cstGcVupevu\n3bv/Cl50Z6360+Xr0rl64KI1vmNLh+XHlfsDF3/Jdse3ivPlZ+87kMlJfAAA4FxTQc/Y+Qv2\njX/i7WtGzWxgMxbdPnf0sKXu1AFDx9SM1bas/ixt9CDftLeuqm4L7uBz7Ro2fMLHH84OXCzI\n/VVEmtr+nXYzm2nphqzA1+tzPP5v0npM2eLRdZO90tW3DR10fYvgnqtXr163bl3wYr9+/YzG\nYyYTEQwGg4iYzWa7vcwnKZ6LNE0TEavVGokPergEFk1EoqKiLBbOaghV4D+piERHR+s6v2OG\nKvh/k29ukY5HsGxCXze/v6RT2ioo7P77f48fbn1///OTdN+/z8m50j/+cFv2+PkjmtlMIpLS\nMNX7w+0Lpm+6alybk43jd+eKSJL535/NSWajJ9sjIr6CPVmasU5C24nzxjl92d8tfu3FWY9b\nG8zp2zgusOfatWvnzJkTvOHAgQOtVuuZPtAKYjKZTKaKfuOLAsxms9lsDvcsIk/k/k8Jr6go\n3rlVFtHR0eGeAk4Lj2DZhL5uPp+vhGsrIg4OfDf1jU1VZ7x1abHtOX+v13X90V43F91o9/4t\n0kZ0n8vtERGvyy0iLpcrcK3BahORwx5/VUvh78SHPD5TvElEjJbk999//+gwSZ16j966tOfy\n1zb0faFDYFPlypWbNGkSvCO/3+/1es/ogVYEo9GoaZrf7y852FFMoINZt9IKrJvP5+OZp9Bp\nmhZ48ol1K5XgukXid2YUxSNYNqGvm9/vL+HVp4oIu4Nf/1pwZO/dt3QLblk8sPcye8vXxkVp\nRvt7C+doRXbWNKOI5B2c36v/wuDGHj16BL6YNOtekZVb8j1VLYVPIWzN9zqbOU94v+dXjl6e\ncTB4sVevXr169QpeTE9Pj8TvufHx8Uaj0e125+bmhnsukSQxMVHTtLy8vOAvCTglg8GQkJAg\nIjk5OR6PJ9zTiRhms9npdIpIdnZ2yb9Yoyir1RoTEyMimZmZ4Z4LTguPYNmUat2SkpJOdlVF\nhF3KnY9Nuqnwp4Luzx7x8Nj2Y/5za+VEW9I/4v9hyUFPt8KT6vQ3nhid1WnoQ1dUt1W+Y9Gi\nO0TEm7+l++3/nmMnuifZ8uqS1Qcv7VJDRDw5P609UtD9sqoikrl16ojnN42fNqVK4Mk83bdy\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Average deaths per month\n",
    "Average_data %>%\n",
    "  ggplot(aes(x=Month, y=deaths))+ geom_col(position = \"dodge\") + labs(\"text\" , title = \"Average deaths per month(2020)\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "cf49ecac",
   "metadata": {
    "_cell_guid": "b1f3e04c-14b6-41bf-ac0c-5b9e0feec664",
    "_uuid": "4cc7ca70-671a-4148-975c-f9c5988d300c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:23.590805Z",
     "iopub.status.busy": "2022-10-25T18:55:23.589540Z",
     "iopub.status.idle": "2022-10-25T18:55:23.847153Z",
     "shell.execute_reply": "2022-10-25T18:55:23.844926Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.272295,
     "end_time": "2022-10-25T18:55:23.849938",
     "exception": false,
     "start_time": "2022-10-25T18:55:23.577643",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nu/dA8xJT1ef5RvvtN2a7HqoT/nxhpPLHz44T0eoqc8JFCXZDdeGJik62SZ6nxa56xwdPPHF2\nmbqSLZVE9MQTT7R42uOPP965MAAAuqe+8erdpwyty6USltFsyy8AOC9/LFDcfoWq2Kt37bq6\n6aG1bvPfDtcNfnkEET0ycfi7pkmv/PebftFC3tev3jwpy3GwZGH22ZkJduOe4bnzHNazo2kt\n+tVENDH87JrhE8MV766rJKLf6izOLxZob8mzilyu633LEx++dvdU797ReRK7qh3vLd7RsnDx\n4sUtSpDYAQC4dVG/qJ/31zRYnc3uH4yIzxoYowrU/hMA3cPcKSMunTy86eHHP278+MeNHa3k\nhksm3HDJhKaHX/y21cMX7v3x9YULHrANv+Prm/s0lrzw7+3V6/RLXFna8NGT7d9HP3nHpoUr\nZ7VTg8NUT0TJirOpV7JCYq22OsyHK5l0SNLcTTUrYx3V375+33X3TNPklj83Nr6j747aT+zW\nrl3rRY0AANBEq5Q+dkn64h+KDFbnmTLOOd9wpGZG/+jYMIyxA/DU8tU7Xvqss1uYfvTDho9+\n2ND0UKtW3n/9zPZfYirLu3/BwndWlV374Bu/P3GjRmDFBb9yLk6KUDR/ms5WQDSLuN1oshGR\nzWgi4kbj6cmtao1Gqg4nolKbM1N5+pe6YqtTniiXqnLMZvOZalKuffyrbe+Gf3Tvuue2XuXF\nG2wvsZs8GasQAwB01tEqc4PFTq6WOjr9t97oeHfDqYdnZgQ5OICuJAgLFNfu+TB37K2yKX/d\ndOyfY5I1rkJZhEqQ6oyN5c2H0DImJaKGk09EpD3TVBgWdnr/wIMme0rEFKLPNjdYM5WnVynf\nZrDFToxtfdKL07QflZ307g1h7C4AgH9tOFrn+vQ/0xfLiUgk2lXcaMAyxQAe4/7R3hmd9ZdN\n/qvmpvcPrnilKasjooiMW7iz/o2TFsVp8kdmT1u4pIiIwlOfdlVrbciTyBObztJXJdXEX5+j\nkr359emMzVr3y4pa88wbMiq23pqa1v+Y5UyjPnd8drQ+buKel0KrAAAgAElEQVRo775LWO4E\nAMC/Khts7m8dnFcb7Vos+Q7gIX8sd9LurNj6okc31ltfmBrx04oVTYWK8NwLJ85+8aKkhyZc\nqnnlobE5kSvf/9vLm0p++ar3eU7FFEseHDP2vpkfpS0dF29+ceH1upybn87WcdtjSQ3ZE2be\n+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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "day_wise %>% \n",
    "\n",
    "  ggplot() + geom_jitter(mapping = aes(x= MonthName, y = Recovered, color = Deaths)) + labs(\"text\", title = \"Recovery rate Vs Deaths\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "38074c18",
   "metadata": {
    "_cell_guid": "911311bb-ebfe-45d0-97cb-3ecb8d1a1dc5",
    "_uuid": "23a1ef30-e076-45cd-bfa8-0c4f0c8b8feb",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-10-25T18:55:23.876632Z",
     "iopub.status.busy": "2022-10-25T18:55:23.875338Z",
     "iopub.status.idle": "2022-10-25T18:55:24.464757Z",
     "shell.execute_reply": "2022-10-25T18:55:24.461416Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.605742,
     "end_time": "2022-10-25T18:55:24.467417",
     "exception": false,
     "start_time": "2022-10-25T18:55:23.861675",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nkMT/AXjxFRP1bODJAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "worldometer_data %>%\n",
    "  ggplot() + geom_col(mapping = aes(x = Continent, y = TotalCases, fill = Continent)) + labs(\"text\", title = \"Number of cases in each continent\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5256ea18",
   "metadata": {
    "_cell_guid": "f3cb6aba-dff7-41c6-aa4b-95b7a210d3c2",
    "_uuid": "81b1f63a-9f4e-445f-b4a1-1c4062178e26",
    "papermill": {
     "duration": 0.017576,
     "end_time": "2022-10-25T18:55:24.503811",
     "exception": false,
     "start_time": "2022-10-25T18:55:24.486235",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Embed Covid Dashboard With Kaggle Notebook\n",
    "\n",
    "This dashboard focuses on the Covid-19 trend from January 2020 to July 2020 and was generated using the latest worldometer data and country-specific information.\n",
    "Using this dashboard, one may determine the general trend and trend line of covid infections across continents using the given data. \n",
    "Using all filters, it is also possible to examine quantifiable data across areas.\n",
    "\n",
    "[Dashboard](https://public.tableau.com/views/Covid19dashboard_16667040297780/Dashboard2?:language=en-GB&publish=yes&:display_count=n&:origin=viz_share_link)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6447cf92",
   "metadata": {
    "papermill": {
     "duration": 0.021162,
     "end_time": "2022-10-25T18:55:24.543614",
     "exception": false,
     "start_time": "2022-10-25T18:55:24.522452",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Share \n",
    "* The first case of Covid-19 was reported in December 2019, and the following month in January 2020, an epidemic was proclaimed. \n",
    "* The information that has been given covers the first seven months of the critical observation. The spread of COVID-19 in various locations during its early months is shown in the dashboard that can be seen above. \n",
    "* The month of July had the largest number of reported cases throughout all of the impacted continents, which, in order, are North America, Asia, and South America. \n",
    "* Due to the fact that the article relies mostly on reporting from public data sources rather than directly collecting the information from the groups that are monitoring COVID-19, these statistics may be distorted. \n",
    "* We can detect a progressive shift in mortality rates and fast recovery rates, indicating that measures were immediately put into place to treat the illness.\n",
    "* As the number of patients rose, we can see these changes. Despite the high mortality rate in North America and South America, there are still a lot of people.\n",
    "\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 68.005213,
   "end_time": "2022-10-25T18:55:24.687111",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-10-25T18:54:16.681898",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
