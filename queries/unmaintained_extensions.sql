SELECT
    extensionName,
    publisherDisplayName,
    install as total_installs,
    averagerating as rating,
    ratingcount as number_of_ratings,
    trendingdaily as daily_trend,
    date(lastUpdated) as last_update,
    round((julianday('now') - julianday(lastUpdated))/365, 1) as years_since_update
FROM vscode_extensions
WHERE
    install > 50000
    AND averagerating > 4.0
    AND lastUpdated < date('now', '-1 year')
    AND trendingdaily > 0
ORDER BY
    install * (julianday('now') - julianday(lastUpdated)) DESC  -- Prioritize popular + old
LIMIT 30;
