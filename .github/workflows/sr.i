name: Broken Link Checker

on:
  push:
    branches:
      - main

jobs:
  Broken-link-checker:
    runs-on: ubuntu-latest

    steps:
    
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: "3.9"

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install requests
          pip install beautifulsoup4
          pip install lxml

      - name: Run Broken-link-checker on https://www.telangana.gov.in/
        run: |
          Broken-link-checker https://www.telangana.gov.in/ \
            --filter-level 3 \
            --output-format csv,json \ 
            --file-output results.csv,results.json
