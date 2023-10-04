const jsdom = require('jsdom');
const { JSDOM } = jsdom;
const fs = require('fs');

async function scrapeAndSaveToCSV(targetUrls, csvFilePath) {
    const dataToSave = [];

    for (const url of targetUrls) {
        const dom = await JSDOM.fromURL(url);
        const document = dom.window.document;

        // Locator to select product item containers
        const itemContainers = document.querySelectorAll('.productItemWrapper'); // Adjust the selector as needed

        itemContainers.forEach((itemContainer) => {
            const titleElement = itemContainer.querySelector('p'); // Adjust the selector as needed

            // Check if the item container has the "offStock" class
            const offStockElement = itemContainer.querySelector('.offStock');
            if (!offStockElement) {
                // Extract the title
                const title = titleElement ? titleElement.textContent.trim() : '';

                // Extract the price if it exists
                const priceElement = itemContainer.querySelector('.price');
                const price = priceElement ? priceElement.textContent.trim() : '';

                // Extract the link and image
                const linkElement = itemContainer.querySelector('a');
                const link = linkElement ? `Link: ${linkElement.href}` : '';
                const imgElement = itemContainer.querySelector('img');
                const img = imgElement ? `Image: ${imgElement.src}` : '';

                dataToSave.push({ Title: title, Price: price, Link: link, Image: img });
            }
        });
    }

    // Create a custom CSV string with "Title:", "Price:", "Link:", and "Image:" labels
    let csvString = '';

    dataToSave.forEach((item) => {
        csvString += `Title: ${item.Title}\nPrice: ${item.Price}\n${item.Link}\n${item.Image}\n\n`;
    });

    // Write the CSV string to a file
    fs.writeFileSync(csvFilePath, csvString);

    console.log(`Data saved to ${csvFilePath}`);
}

const targetUrls = [
    'https://www.apotekasrbotrade.rs/srpski/proizvodi/dodaci-ishrani?page=9999',
    'https://www.apotekasrbotrade.rs/srpski/proizvodi/kozmetika-444?page=9999',
    'https://www.apotekasrbotrade.rs/srpski/proizvodi/nega-i-zastita-2?page=9999',
    // Add more target URLs as needed
];

const csvFilePath = 'output.csv'; // Specify the path for the CSV file
scrapeAndSaveToCSV(targetUrls, csvFilePath).catch((error) => {
    console.error('Error:', error);
});
