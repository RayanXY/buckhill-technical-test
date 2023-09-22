{
	"and": [
		{ "!=": [{"var": "data.amount_due"}, null] },
		{ ">=": [{"var": "data.created_at"}, "2021-01-01"] },
		{ "in": [{"var": "data.address.country"}, ["Croatia", "Italy"]] }
	]
}
