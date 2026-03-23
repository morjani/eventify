<div class="page-body" id="page-edit-event">
    <div class="container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-sm-6">
                    <h3>Configuration Event</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('index') }}">
                                <svg class="stroke-icon">
                                    <use href="../assets/svg/icon-sprite.svg#stroke-home"></use>
                                </svg>
                            </a>
                        </li>
                        <li class="breadcrumb-item">Event</li>
                        <li class="breadcrumb-item active">Configuration</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Edit Event</h5>
                    </div>
                    <div class="card-body">
                        <form id="form_event" method="POST" action="{{ route('update-config-event', $event->id_event) }}">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="col-sm-6 mb-3">
                                    <label class="form-label" for="event_nom">Nom
                                        <span class="txt-danger">*</span>
                                    </label>
                                    <input type="text" name="nom" class="form-control" id="event_nom" placeholder="Enter event name"
                                           required value="{{ $event->nom }}">
                                </div>
                                <div class="col-sm-6 mb-3">
                                    <label class="form-label" for="event_date">Date
                                        <span class="txt-danger">*</span>
                                    </label>
                                    <input type="date" name="date" class="form-control" id="event_date"
                                           required value="{{ $event->date }}">
                                </div>
                                <div class="col-sm-12 mb-3">
                                    <label for="event_description">Description</label>
                                    <textarea name="description" id="event_description" class="form-control">{{ $event->description }}</textarea>
                                </div>
                                <div class="col-sm-6 mb-3">
                                    <label for="inscription_ouverte">Inscription Ouverte</label>
                                    <select name="inscription_ouverte" id="inscription_ouverte" class="form-select">
                                        <option value="0" {{ $event->inscription_ouverte == 0 ? 'selected' : '' }}>Fermée</option>
                                        <option value="1" {{ $event->inscription_ouverte == 1 ? 'selected' : '' }}>Ouverte</option>
                                    </select>
                                </div>
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary">Update Event</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>