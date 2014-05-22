window.User = Backbone.Model.extend({
	urlRoot: "/users",

	idAttribute: "_id",

	initialize: function() {
		this.validators = {};
		this.validators.name = function (value) {
			return value.length > 0 ? {isValid: true} : {isValid: false, message: "Email cannot be blank"};
		};
	},

	validate: function(attrs, options) {
		// TODO Write validations
	},

	defaults: {
		_id: null,
		name: "user@email.com",
		password: ""
	}

});