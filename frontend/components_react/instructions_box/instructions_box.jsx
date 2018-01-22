import React from 'react';
import Default from 'components_react/instructions_box/instructions/default';
import Instruction_1 from 'components_react/instructions_box/instructions/1';
import Instruction_2 from 'components_react/instructions_box/instructions/2';
import Instruction_3 from 'components_react/instructions_box/instructions/3';

export default class InstructionsBox extends React.Component {
    constructor() {
        super();
        this.state = {
            page: 0
        }
    }

    _changePage(page) {
        this.setState({page: page});
    }

    _instructionsNav() {
        return (
            <div className='cell small-12 medium-3 large-2'>
                <div className='catalog_nav'>
                    <a className='button' onClick={this._changePage.bind(this, 1)}>Инструкция к эрго-рюкзаку (слингу-рюкзаку)</a>
                    <a className='button' onClick={this._changePage.bind(this, 2)}>Инструкция к май-слингу</a>
                    <a className='button' onClick={this._changePage.bind(this, 3)}>Инструкция к слингу-рюкзаку для двойни</a>
                </div>
            </div>
        );
    }

    _instructionView() {
        switch(this.state.page) {
            case 1:
                return <Instruction_1 />
            case 2:
                return <Instruction_2 />
            case 3:
                return <Instruction_3 />
        }
    }

    _selectRenderPage() {
        if(this.state.page == 0) return <Default page={this.state.page} onPageClick={this._selectPage.bind(this)} />;
        return (
            <div className='grid-x'>
                {this._instructionsNav()}
                {this._instructionView()}
            </div>
        );
    }

    _selectPage(page) {
        this.setState({page: page});
    }

    render() {
        return (
            <div>
                {this._selectRenderPage()}
            </div>
        );
    }
}