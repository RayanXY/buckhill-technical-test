{
	">=": [
		{
			"reduce": {
				"var": "",
				"initial": 0,
				"arr": [
					{ "!=": [{"var": "data.user.email_verified_at"}, null] },
					{ ">": [{"var": "data.products", "length": {}}, 2] },
					{ "===": [{"var": "data.payment.type"}, "bank_transfer"] },
					{ "!=": [{"var": "data.order_status.title"}, "shipped"] },
				],
				"body": {
					"+": [{"var": "accumulator"}, {"var": "current"}]
				}
			}
		},
		2
	]
}
