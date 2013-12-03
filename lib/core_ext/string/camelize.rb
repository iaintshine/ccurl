module CoreExt
	module String
		def camelize
			self.split("_").collect(&:capitalize).join
		end
	end
end

String.send(:include, CoreExt::String)