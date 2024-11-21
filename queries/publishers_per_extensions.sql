-- Purpose: This query is used to find the number of publishers that have a certain number of extensions.
with counts as (
  select publisherId, count(distinct extensionId) as extension_count
  from vscode_extensions
  group by publisherId
)
select extension_count, count(*) as publisher_count
from counts
where extension_count between 1 and 1000
group by extension_count
order by extension_count;