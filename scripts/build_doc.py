import subprocess

from pathlib import Path


if __name__ == '__main__':
    root_dir = Path('.')

    sections = []
    for dcm_file in root_dir.glob('*.dcm'):
        symbols = []
        with open(dcm_file, 'r') as file:
            symbol = None
            for line in file:
                if line.startswith('#') or line.startswith('EESchema-DOCLIB'):
                    continue
                elif line.startswith('$CMP '):
                    symbol = {
                        'name': line[5:-1],
                        'description': None,
                        'link': None,
                    }
                elif line.startswith('D') and symbol:
                    symbol['description'] = line[2:-1]
                elif line.startswith('F') and symbol:
                    symbol['link'] = line[2:-1]
                elif line.startswith('$ENDCMP'):
                    symbols.append(symbol)
                    symbol = None

        sections.append({'name': dcm_file.name[:-4], 'symbols': symbols})

    for section in sections:
        section_name = section['name']

        print(f"### {section_name}\n")
        print('| Symbol | Description | 3D Shape? |')
        print('| ------ | ----------- | --------- |')

        for symbol in section['symbols']:
            name = symbol['name']
            description = symbol['description'] or ''

            link = symbol['link']
            if link:
                description += f' ([link]({link}))'

            has_shape = 'No'
            shape = root_dir / f'{section_name}.3dshapes' / f"{name}.scad"
            if shape.exists():
                png_file = root_dir / 'docs' / f'{section_name}_{name}.png'
                subprocess.call(
                    [
                        'openscad',
                        '-o',
                        png_file,
                        '--imgsize',
                        '300,200',
                        '--autocenter',
                        '--viewall',
                        shape,
                    ],
                    stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL,
                )
                has_shape = f'![Preview of {name}]({png_file})'

            print(f"| {symbol['name']} | {description} | {has_shape} |")
