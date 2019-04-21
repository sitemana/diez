import {Color} from '@diez/designsystem';
import {join} from 'path';
import {IosBinding} from '../../targets/ios.api';
import {sourcesPath} from '../../utils';

const binding: IosBinding<Color> = {
  sources: [join(sourcesPath, 'ios', 'bindings', 'Color.swift')],
  imports: ['UIKit'],
};

export = binding;