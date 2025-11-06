from typing import List
from pydantic import Field
from mcp.server.fastmcp import FastMCP

# Create the server with debug logging to help during dev
mcp = FastMCP("TodoMCP", log_level="DEBUG")

# In-memory store
items: dict[int, str] = {
    1: "Create an app",
    2: "Deploy an app",
}

@mcp.tool(
    name="list_todo_items",
    description="List available items in the TODO task list.",
)
def list_items() -> List[str]:
    """Return the current TODO items as 'id: text' strings."""
    return [f"{key}: {value}" for key, value in items.items()]

@mcp.tool(
    name="add_todo_item",
    description="Add a new item to the TODO task list.",
)
def add_item(item: str) -> str:
    """Add a new item and return a confirmation string."""
    next_key = (max(items.keys()) + 1) if items else 1
    items[next_key] = item
    return f"Added {next_key}: {item}"

@mcp.tool(
    name="complete_todo_item",
    description="Mark an item completed by removing it from the list.",
)
def complete_item(item_id: int) -> str:
    """Remove the item if it exists and return a status message."""
    removed = items.pop(item_id, None)
    if removed is None:
        return f"Item {item_id} not found."
    return f"Completed {item_id}: {removed}"

if __name__ == "__main__":
    # Start the MCP server over stdio (blocks)
    mcp.run()

