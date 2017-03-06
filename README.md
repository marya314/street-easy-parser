# Street Easy Parser

Street Easy Parser is a lightweight Ruby program that scrapes the most expensive sales and rental listings in the SOHO neighborhood from a search on streeteasy.com. The results are structured then stored in a JSON file. Street Easy Parser does not scrape directly from the website due to a 405 error.

## Usage

1. Run `bundle install`.
2. Run `ruby lib/runner.rb`.
3. Open the resulting listings.json file.
