import bibtexparser

month_list: list[str]= ['jan', 'feb', 'mar','apr', 'may','jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec']
month_dict :dict[str,int] = {month_list[i]:f'{i+1}' for i in range(len(month_list))}

with open('bibliografia.bib') as bibtex_file:
    bib_database = bibtexparser.load(bibtex_file)

for entry in bib_database.entries:
    try:
        entry['month'] = month_dict[entry['month']]
    except KeyError:
        pass


with open('bib2.bib', 'w') as file:
    file.write(bibtexparser.dumps(bib_database))