/**
 * Retrieves the band name and lifespan of glam rock bands from the
 * metal_bands table
 * @return A result set containing the band name and lifespan of glam rock
 * bands, ordered by lifespan in descending order
 */
-- Retrieve data
SELECT band_name,
    (IFNULL(split, 2022) - formed) AS lifespan -- calculate the lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
