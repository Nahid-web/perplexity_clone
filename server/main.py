import asyncio
import traceback
from fastapi import FastAPI, WebSocket
from pydantic_models.chat_body import ChatBody

from pydantic_models.chat_body import ChatBody

from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService


app = FastAPI()
search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()

# chat websocket


@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()
    print("WebSocket connection established")
    try:
        await asyncio.sleep(0/1)

        data = await websocket.receive_json()
        query = data.get("query")
        print(query)

        search_results = search_service.web_search(query)

        print("search result completed")

        sorted_results = sort_source_service.sort_sources(
            query, search_results)
        print("sort result completed")

        await asyncio.sleep(0/1)

        await websocket.send_json({"type": "search_results", "data": sorted_results})

        for chunk in llm_service.generate_response(query, sorted_results):
            print(f'Sending chunk: {chunk}')
            await asyncio.sleep(0/1)
            await websocket.send_json({"type": "response", "data": chunk})

    except:
        print("Unexpected error:")
        traceback.print_exc()
        await websocket.send_json({"type": "error", "data": "An error occurred on the server."})

    finally:
        await websocket.close()


@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_results = search_service.web_search(body.query)

    # print(f'Search results: {search_results}')

    sorted_results = sort_source_service.sort_sources(
        body.query, search_results)

    print(f'Sorted results: {sorted_results}')

    response = llm_service.generate_response(body.query, sorted_results)
    print(f'Response: {response}')

    return response
