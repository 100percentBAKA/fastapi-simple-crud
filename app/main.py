from fastapi import FastAPI
from app.routes.users import router as users_router
import uvicorn

app = FastAPI()

# Include the user routes
app.include_router(users_router)


@app.get("/")
async def root():
    return {"message": "Hello World"}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
