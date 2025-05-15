from fastapi import FastAPI, Request
from datetime import datetime
import uvicorn

app = FastAPI()

@app.get("/")
async def root(request: Request):
    client_ip = request.client.host
    return {
        "timestamp": datetime.utcnow().isoformat(),
        "ip": client_ip
    }

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000)
