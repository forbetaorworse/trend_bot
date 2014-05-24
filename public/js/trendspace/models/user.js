window.User = Backbone.Model.extend({
	urlRoot: "/users",

	idAttribute: "_id",

	initialize: function() {
		this.bind("change", this.attributesChanged);
	},

	attributesChanged: function(){
      var valid = false;
      if (this.get('username') && this.get('password'))
        valid = true;
      this.trigger("validated", valid);
    },

	validate: function(attrs, options) {
		// TODO Write validations
	},

	defaults: {
		_id: null,
		name: "",
		email: "",
		password: ""
	}
});


// Login Credentials model
window.Credentials = Backbone.Model.extend({
	initialize: function() {
		this.bind("change", this.attributesChanged);
	},

	attributesChanged: function() {
		var valid = false;
		if (this.get('username') && this.get('password'))
			valid = true;
		this.trigger("validated", valid);
	}
});