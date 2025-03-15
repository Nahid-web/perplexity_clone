from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily_clint = TavilyClient(api_key=settings.TAVILY_API_KEY)


class SearchService:
    def web_search(self, query: str):
        try:
            results = []
            response = tavily_clint.search(query, max_results=10)
            search_results = response.get('results', [])

            for result in search_results:
                download = trafilatura.fetch_url(result.get('url'))
                content = trafilatura.extract(download, include_comments=False)

                results.append({
                    "title": result.get('title', ''),
                    "url": result.get('url'),
                    "content": content,
                })

            return results
        except Exception as e:
            print(e)
