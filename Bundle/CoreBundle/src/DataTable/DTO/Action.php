<?php

namespace Umbrella\CoreBundle\DataTable\DTO;

use Twig\Environment;
use Umbrella\CoreBundle\DataTable\Action\ActionType;

class Action
{
    protected ActionType $type;

    protected array $options;

    public function __construct(ActionType $type, array $options)
    {
        $this->type = $type;
        $this->options = $options;
    }

    public function getType(): ActionType
    {
        return $this->type;
    }

    public function getOptions(): array
    {
        return $this->options;
    }

    public function render(Environment $twig): string
    {
        return $this->type->render($twig, $this->options);
    }
}
