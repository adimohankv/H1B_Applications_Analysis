-- Create a bar graph to depict the number of applications for each year

select h1b.year,count(h1b.year) as no_of_applications from h1b where h1b.year is not NULL group by h1b.year order by h1b.year;