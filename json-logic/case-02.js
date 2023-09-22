{
	"and": [
		{ ">=": [{"var": "data.delivery_fee"}, 0] },
		{ "!=": [{"var": "data.payment"}, null] },
		{ "===": [{"var": "data.order_status.title"}, "shipped"] }
	]
}
