const pokemons = [
	"totodile",
	"charizard",
	"Pikachu",
];

exports.handler = async (event) => {
	return {
		statusCode: 200,
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify({ pokemons }), //sending the array of movies as stringified JSON in the response
	};
};
