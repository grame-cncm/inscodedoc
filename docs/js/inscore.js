/*
Language: Inscore
Description: Inscore is an open source environment for the design of augmented, interactive and dynamic music score.
Author: Dominique Fober <fober@grame.fr>
*/

function inscore(hljs) {
  return {
    name: 'inscore',
    aliases: ['inscore.in'],
    case_insensitive: false,
    keywords: {
      keyword: 'absolutexy accept alias alpha angle animate animated arrows autoscale autoVoicesColoration blue brightness browse brushStyle calibrate cancel clear clipPitch clipTime clock close color columns compatibility connect count dalpha dangle date dblue dbrightness dcolor ddate dduration debug default defaultShow del dgreen dhsb dhue dimension disconnect dpage drange dred drotatex drotatey drotatez dsaturation dscale dshear dstart dtempo duration durClock dx dxorigin dy dyorigin dz edit effect end error errport eval event export exportAll expr follow fontFamily fontSize fontStyle fontWeight foreground forward frame frameless fullscreen get green guido-version hasZ height hello hsb hue in keyboard learn level likelihoodthreshold likelihoodwindow load lock map+ map mapf max measureBars mls mode mouse musicxml-version name new opengl order osc out outport page pageCount pageFormat path penAlpha penColor pendAlpha penStyle penWidth pitchLines play pop port preprocess push quit radius range rate rcount read red reject require reset resetBench rootPath rotatex rotatey rotatez rows run saturation save scale set shear show size smooth stack start status stop success systemCount tempo ticks time tolerance vdate vduration version videoMap videoMapf voiceColor volume watch+ watch width windowOpacity wrap write writeBench x xborder xorigin y yborder yorigin z'
    },
    contains: [
      {
        className: 'variable',
        begin: '\\$'
      },
      hljs.HASH_COMMENT_MODE,
      hljs.QUOTE_STRING_MODE,
      hljs.NUMBER_MODE
    ]
  };
}

hljs.registerLanguage ('incore', inscore);
