package classes
{
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;
    import flash.display.Sprite;

    /**
     * Wrapper for icon shapes into UIComponent compatible shapes.
     */
    public class UIIcon extends Sprite
    {
        public var icon:DisplayObject;
        private var _sprWidth:Number = 1;
        private var _sprHeight:Number = 1;

        public function UIIcon(parent:DisplayObjectContainer = null, sprite:DisplayObject = null, xpos:Number = 0, ypos:Number = 0)
        {

            mouseChildren = false;

            if (sprite)
            {
                icon = sprite;
                _sprWidth = sprite.width;
                _sprHeight = sprite.height;
                addChild(icon);
            }

            this.x = xpos;
            this.y = ypos;
            if (parent)
                parent.addChild(this);
        }

        public function setSize(w:Number, h:Number):void
        {
            if (icon != null)
            {
                icon.scaleX = icon.scaleY = Math.min(w / _sprWidth, h / _sprHeight);

                this.graphics.clear();
                this.graphics.lineStyle(1, 0, 0);
                this.graphics.beginFill(0, 0);
                this.graphics.drawRect(-(icon.width / 2), -(icon.height / 2), w, h);
                this.graphics.endFill();
            }
        }
    }
}
