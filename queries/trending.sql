-- find the newest extensions with more than 50000 installers
select * from vscode_extensions
where install > 10000
and publishedDate > date('now', '-5 month')
order by publishedDate desc
limit 30;

