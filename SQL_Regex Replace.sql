SELECT project, commits, contributors, regexp_replace(address, '[[:digit:]]', '!', 'g') AS address
FROM repositories