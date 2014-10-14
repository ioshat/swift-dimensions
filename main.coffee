_ = require './helpers'

class Swift
  constraints: ($) ->
    if @options.constraints.verticalTop
      $ "// align #{@name} and superview to top"
      $ "view.addConstraint(NSLayoutConstraint(item: #{@name}, attribute: .Top, relatedBy: .Equal, toItem: #{@options.superviewName}, attribute: .Top, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.verticalCenter
      $ "// center #{@name} vertically in superview"
      $ "view.addConstraint(NSLayoutConstraint(item: #{@name}, attribute: .CenterY, relatedBy: .Equal, toItem: #{@options.superviewName}, attribute: .CenterY, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.verticalBottom
      $ "// align #{@name} and superview to bottom"
      $ "view.addConstraint(NSLayoutConstraint(item: #{@name}, attribute: .Bottom, relatedBy: .Equal, toItem: #{@options.superviewName}, attribute: .Bottom, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.horizontalLeft
      $ "// align #{@name} and superview to left"
      $ "view.addConstraint(NSLayoutConstraint(item: #{@name}, attribute: .Left, relatedBy: .Equal, toItem: #{@options.superviewName}, attribute: .Left, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.horizontalCenter
      $ "// center #{@name} horizontally in superview"
      $ "view.addConstraint(NSLayoutConstraint(item: #{@name}, attribute: .CenterX, relatedBy: .Equal, toItem: #{@options.superviewName}, attribute: .CenterX, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.horizontalRight
      $ "// align #{@name} and superview to right"
      $ "view.addConstraint(NSLayoutConstraint(item: #{@name}, attribute: .Right, relatedBy: .Equal, toItem: #{@options.superviewName}, attribute: .Right, multiplier: 1.0, constant: 0.0))"
      $.newline()

  render: ($) ->
    @constraints $

    if @options.margin.top or @options.margin.bottom
      str = "V:"
      str += "|-#{@bounds.top}-" if @options.margin.top
      str += "[#{@name}]"
      str += "-#{@bounds.bottom}-|" if @options.margin.bottom
      $ "// align #{@name} from the top and bottom"
      $ "view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(\"#{str}\", options: .DirectionLeadingToTrailing, metrics: nil, views: [\"#{@name}\": #{@name}]))"
      $.newline()

    if @options.margin.left or @options.margin.right
      str = "H:"
      str += "|-#{@bounds.left}-" if @options.margin.left
      str += "[#{@name}]"
      str += "-#{@bounds.right}-|" if @options.margin.right
      $ "// align #{@name} from the left and right"
      $ "view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(\"#{str}\", options: .DirectionLeadingToTrailing, metrics: nil, views: [\"#{@name}\": #{@name}]))"
      $.newline()

    if @options.dimensions.width
      $ '// width constraint'
      $ "view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(\"H:[#{@name}(==#{@bounds.width})]\", options: .DirectionLeadingToTrailing, metrics: nil, views: [\"#{@name}\": #{@name}]))"
      $.newline()

    if @options.dimensions.height
      $ '// height constraint'
      $ "view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(\"V:[#{@name}(==#{@bounds.height})]\", options: .DirectionLeadingToTrailing, metrics: nil, views: [\"#{@name}\": #{@name}]))"
      $.newline()

exports.renderClass = Swift
