select publisherDisplayName, count(distinct extensionId) as extensionCount, sum(downloadCount) as totalDownloadCount, min(lastUpdated) as firstUpdated, max(lastUpdated) as lastUpdated
from vscode_extensions
group by publisherDisplayName
order by extensionCount desc
limit 20;