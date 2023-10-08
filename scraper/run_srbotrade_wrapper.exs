import Crawly
import PharmaPrice

Crawly.Engine.start_spider(PharmaPrice.Spiders.SrboTradeScraper)
