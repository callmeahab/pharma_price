import Crawly
import PharmaPrice

Crawly.Engine.start_spider(PharmaPrice.Spiders.SrboTradeScraper)
Crawly.Engine.start_spider(PharmaPrice.Spiders.ApotekaOnlineScraper)
