import succulentio
from succulentio import adapters

app = succulentio.setup(
    adapters=[
        adapters.cli(),
        adapters.aiohttp(),
    ],
    middleware=[],
)


def run():
    app.run()
