/**
 * IMPORTANT: This file only contains theme JSS of the Publisher app, Don't add other configuration parameters here.
 * This theme file is an extension of material-ui default theme https://material-ui.com/customization/default-theme/
 * Application related configurations are located in `<PUBLISHER_ROOT>site/public/theme/settings.json`
 */
const userThemes = {
    light(theme) {
        return (
            {
                palette: {
                    primary: {
                        main: '#31A2D9',
                    },
                    secondary: {
                        main: '#2A2559',
                    },
                    background: {
                        appBar: '#31A2D9',
                        appBarSelected: '#2A2559',
                        leftMenu: '#2A2559',
                        leftMenuActive: '#31A2D9',
                        drawer: '#2A2559',
                        activeMenuItem: '#31A2D9',
                    },
                },
                custom: {
                    logo: '/site/public/images/logo-removebg-preview.png',
                    logoHeight: 60,
                    logoWidth: 'auto',
                    appBar: {
                        background: '#31A2D9',
                        searchInputBackground: '#ffffff',
                        searchInputActiveBackground: '#ffffff',
                    },
                    thumbnail: {
                        colorMap: {
                            a: '#31A2D9',
                            b: '#2A2559',
                            c: '#4BB8E8',
                            d: '#1e1d45',
                            e: '#25BBE0',
                            f: '#383673',
                            g: '#1F8CB8',
                            h: '#4d4a8c',
                            i: '#2EC5EB',
                            j: '#221f4f',
                            k: '#1B7AA0',
                            l: '#5a5699',
                            m: '#38D4F7',
                            n: '#342f6b',
                            o: '#31A2D9',
                            p: '#2A2559',
                            q: '#45B0DD',
                            r: '#3d3876',
                            s: '#28A8D5',
                            t: '#524d99',
                            u: '#1D92C0',
                            v: '#26234d',
                            w: '#35B5E5',
                            x: '#48428a',
                            y: '#2299C8',
                            z: '#2e2a5f',
                        },
                    },
                },
                overrides: {
                    MuiRadio: {
                        colorSecondary: {
                            '&$checked': { color: theme.palette.primary.main },
                            '&$disabled': {
                                color: theme.palette.action.disabled,
                            },
                        },
                    },
                    MuiInputBase: {
                        root: {
                            '&.HeaderSearch-input': {
                                background: '#ffffff !important',
                            },
                            '&.HeaderSearch-inputFocused': {
                                background: '#ffffff !important',
                            },
                        },
                        input: {
                            '&::placeholder': {
                                color: '#666666',
                            },
                        },
                    },
                },
            }
        );
    },
};
if (typeof module !== 'undefined') {
    module.exports = userThemes; // Added for tests
}
