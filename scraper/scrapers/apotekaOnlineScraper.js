const jsdom = require('jsdom');
const { JSDOM } = jsdom;
const fs = require('fs');
const path = require('path'); // Import the 'path' module

async function scrapeAndSaveToCSV(baseUrls, csvFilePath) {
    let csvString = 'Title,Price,Link,Image\n'; // Header row for CSV
    let page = 1;
    const scrapedTitles = new Set();

    for (const baseUrl of baseUrls) {
        page = 1; // Reset page for each baseUrl

        while (true) {
            const url = `${baseUrl}${page}`;
            const dom = await JSDOM.fromURL(url);
            const document = dom.window.document;

            // Locator to select product item containers
            const itemContainers = document.querySelectorAll('.product.product--grid'); // Adjust the selector as needed

            if (itemContainers.length === 0) {
                // No more items found on the current page, exit the loop
                break;
            }

            itemContainers.forEach((itemContainer) => {
                const titleElement = itemContainer.querySelector('.product__name'); // Adjust the selector as needed

                // Check if the item container has the "offStock" class
                const offStockElement = itemContainer.querySelector('.grid-image.grid-image--out-of-stock');
                if (!offStockElement) {
                    // Extract the title
                    const title = titleElement ? titleElement.textContent.trim() : '';

                    // Check if the title has already been scraped
                    if (!scrapedTitles.has(title)) {
                        // Extract the price if it exists
                        const priceElement = itemContainer.querySelector('.product__info.product__info--price-gross');
                        const price = priceElement ? priceElement.textContent.trim() : '';

                        // Extract the link and image
                        const linkElement = itemContainer.querySelector('.grid-image__link');
                        const link = linkElement ? linkElement.href : '';
                        const imgElement = itemContainer.querySelector('.grid-image__image-wrapper > img');
                        const img = imgElement ? imgElement.getAttribute('data-src') : ''; // Get image URL from data-src attribute

                        // Append the data to the CSV string
                        csvString += `"${title}","${price}","${link}","${img}"\n`;

                        // Add the title to the set of scraped titles
                        scrapedTitles.add(title);
                    }
                }
            });

            // Move to the next page
            page++;
        }
    }

    // Write the CSV string to a file
    fs.writeFileSync(csvFilePath, csvString);

    console.log(`Data saved to ${csvFilePath}`);
}

const baseUrls = [
    'https://www.apoteka-online.rs/catalog/kozmetika-33/p',
    'https://www.apoteka-online.rs/catalog/imunitet-14/p',
    'https://www.apoteka-online.rs/catalog/bebe-i-deca-19/p',
    'https://www.apoteka-online.rs/catalog/vitamini-i-minerali-18/p',
    'https://www.apoteka-online.rs/catalog/trudnoca-i-dojenje-22/p',
    'https://www.apoteka-online.rs/catalog/kosa-nokti-koza-10/p',
    'https://www.apoteka-online.rs/catalog/zdravlje-srca-i-krvnih-sudova-8/p',
    'https://www.apoteka-online.rs/catalog/zdravlje-zene-9/p',
    'https://www.apoteka-online.rs/catalog/flasteri-80/p',
    'https://www.apoteka-online.rs/catalog/poklon-paketi-66/p',
    'https://www.apoteka-online.rs/catalog/promo-pakovanja-85/p',
    'https://www.apoteka-online.rs/catalog/zdravlje-muskarca-potencija-prostata-20/p',
    'https://www.apoteka-online.rs/catalog/sve-po-119-dinara-61/p',
    'https://www.apoteka-online.rs/catalog/zdrav-zivot-62/p',
    'https://www.apoteka-online.rs/catalog/hrana-za-posebne-namene-108/p',
    'https://www.apoteka-online.rs/catalog/za-sportiste-99/p',
    'https://www.apoteka-online.rs/catalog/uho-grlo-nos-12/p',
    'https://www.apoteka-online.rs/catalog/zdravlje-mokracnih-kanala-28/p',
    'https://www.apoteka-online.rs/catalog/varenje-i-metabolizam-16/p',
    'https://www.apoteka-online.rs/catalog/mrsavljenje-17/p',
    'https://www.apoteka-online.rs/catalog/kosti-misici-i-zglobovi-21/p',
    'https://www.apoteka-online.rs/catalog/pamcenje-koncentracija-bol-29/p',
    'https://www.apoteka-online.rs/catalog/stres-i-nesanica-15/p',
    'https://www.apoteka-online.rs/catalog/kapi-za-oci-i-rastvori-za-sociva-23/p',
    'https://www.apoteka-online.rs/catalog/oralna-higijena-27/p',
    'https://www.apoteka-online.rs/catalog/prezervativi-i-lubrikanti-48/p',
    'https://www.apoteka-online.rs/catalog/razno-51/p',
    'https://www.apoteka-online.rs/catalog/testovi-54/p',
    'https://www.apoteka-online.rs/catalog/aromaterapija-i-biljna-ulja-55/p',
    'https://www.apoteka-online.rs/catalog/promo-cene-hemofarm-84/p',
    'https://www.apoteka-online.rs/catalog/meraci-pritiska-inhalatori-toplomeri-56/p',
    // Add more base URLs as needed
];
const csvFilePath = 'apotekaOnline.csv'; // Specify the path for the CSV file relative to the repository root
scrapeAndSaveToCSV(baseUrls, csvFilePath).catch((error) => {
    console.error('Error:', error);
});
