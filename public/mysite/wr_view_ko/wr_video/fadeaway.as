// -*-actionscript-*- Time-stamp: <fadeaway.as - root>
// copyright (c) 2006-2007 konstantin.co.uk. all rights reserved.

package
{
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.net.*;
    import flextrace.Dumper;

    public class fadeaway extends Sprite
    {
        private var _alpha:BitmapData;
        private var _circle:Shape;
        private var _current:BitmapData;
        private var _data:BitmapData;
        private var _delta:Point;
        private var _filter:BlurFilter;
        private var _loader:Loader;
        private var _patch:Bitmap;
        private var _tool:Sprite;

        private var parameters:Object;	        
        
        public function fadeaway(parameters:Object)
        {
                        
	    this.parameters = parameters;

            try
            {
                var loader:Loader = new Loader();
                                                                
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_on_complete);
                loader.load(new URLRequest(parameters.url));
               
            }
            catch (error:*) {}
        }

        private function loader_on_complete(e:Event):void
        {
            _loader = e.target.loader;

            if (_loader)
            {

                _current = Bitmap(_loader.content).bitmapData;
                _data = _current.clone();
                _filter = new BlurFilter(0, 0, BitmapFilterQuality.HIGH);

                addChild(_loader);
                tool_create();

                _tool.scaleX = _loader.scaleX;
                _tool.scaleY = _loader.scaleY;
                _tool.x = _loader.x;
                _tool.y = _loader.y;

                tool_update();
                _loader.addEventListener(Event.ENTER_FRAME, loader_on_enterframe);
            }
        }

        private function loader_on_enterframe(e:Event):void
        {
            if (_loader && Math.random() < 0.05)
            {
                _filter.blurX = _filter.blurY = 0;
                if (Math.random() < 0.5)
                {
                    _filter.blurX = 1.04;
                }
                else
                {
                    _filter.blurY = 1.04;
                }
                _current.applyFilter(_current, _current.rect, _current.rect.topLeft, _filter);
            }
        }

        private function tool_create():void
        {
            const RADIUS:int = 50;

            _alpha = new BitmapData(RADIUS * 2, RADIUS * 2, true, 0);
            _circle = new Shape();
            _patch = new Bitmap(new BitmapData(RADIUS * 2, RADIUS * 2));
            _tool = new Sprite();

            var shape:Shape = new Shape();

            with (shape.graphics)
            {
                var m:Matrix = new Matrix();

                m.createGradientBox(100, 100, 0, 0, 0);
                beginGradientFill(GradientType.RADIAL, [0, 0], [1, 0], [0, 255], m);
                drawRect(0, 0, RADIUS * 2, RADIUS * 2);
            }
            _alpha.draw(shape);

            with (_circle.graphics)
            {
                clear();
                lineStyle(2, parameters.c);
                drawCircle(RADIUS, RADIUS, RADIUS);
            }
            _tool.addChild(_patch);
            _tool.addChild(_circle);
            _tool.addEventListener(MouseEvent.MOUSE_DOWN, tool_on_mousedown);
            addChild(_tool);
        }

        private function tool_update():void
        {
            with (_patch)
            {
                var r:Rectangle = getBounds(_loader);

                bitmapData.fillRect(bitmapData.rect, 0);
                bitmapData.copyPixels(_data, r, bitmapData.rect.topLeft, _alpha);
                _current.copyPixels(_data, r, r.topLeft, _alpha);
            }
        }

        private function tool_on_mousedown(e:MouseEvent):void
        {           	                          
            _delta = new Point(e.stageX-_tool.x, e.stageY-_tool.y);            
            
            stage.addEventListener(MouseEvent.MOUSE_MOVE, stage_on_mousemove);
            stage.addEventListener(MouseEvent.MOUSE_UP, stage_on_mouseup);
        }

        private function stage_on_mousemove(e:MouseEvent):void
        {
            var p:Point = new Point(e.stageX - _delta.x, e.stageY - _delta.y);
            var x:int = Math.min(_loader.width - _tool.width, Math.max(0, p.x));
            var y:int = Math.min(_loader.height - _tool.height, Math.max(0, p.y));

            if (x != _tool.x || y != _tool.y)
            {
                _tool.x = x;
                _tool.y = y;
                tool_update();
            }
        }

        private function stage_on_mouseup(e:MouseEvent):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, stage_on_mousemove);
            stage.removeEventListener(MouseEvent.MOUSE_UP, stage_on_mouseup);
        }
    }
}
